class Team < ActiveRecord::Base
  has_many :fans, :class_name => "User"
  has_many :games
  
  def to_s
    self.name
  end
end
