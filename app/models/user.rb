class User < ActiveRecord::Base
  
  has_one :profile, :dependent => :destroy
  belongs_to :team
  has_many :check_ins
  has_many :games, :through => :check_ins
  accepts_nested_attributes_for :profile
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_attributes
  
  # authentication using facebook connect
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      user = User.new(:email => data["email"], :password => Devise.friendly_token[0,20])
      user.confirm!
      user.create_profile :first_name => data["first_name"] || "", 
        :last_name => data["last_name"] || "", :points => 0,
        :image_url => "https://graph.facebook.com/#{data["id"]}/picture"
      user.save!
      user
    end
  end

  # authentication using open id
  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token['user_info']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      user = User.new(:email => data["email"], :password => Devise.friendly_token[0,20])
      user.confirm!
      user.create_profile :first_name => data["first_name"] || "", 
        :last_name => data["last_name"] || "", :points => 0
      user.save!
      user
    end
  end
  
  def self.leaders(limit=10)
    User.includes(:profile).order("profiles.points DESC").limit(limit)
  end
  
  def has_checked_in?(game_id)
    !CheckIn.find_by_user_id_and_game_id(self.id, game_id).nil?
  end
end
