class Game < ActiveRecord::Base
  belongs_to :home_team, :class_name => "Team", :foreign_key => "home_team_id"
  belongs_to :away_team, :class_name => "Team", :foreign_key => "away_team_id"
  has_many :check_ins
  has_many :users, :through => :check_ins
  has_many :predictions
  
  default_scope :order => 'time'
  
  validates :home_team_id, :presence => true
  validates :away_team_id, :presence => true
  
  acts_as_commentable
  acts_as_voteable
  
  searchable do
    text :home_team do
      home_team.name
    end
    text :away_team do
      away_team.name
    end
    time :time
  end
end
