class Game < ActiveRecord::Base
  belongs_to :home_team, :class_name => "Team", :foreign_key => "home_team_id"
  belongs_to :away_team, :class_name => "Team", :foreign_key => "away_team_id"
  has_many :check_ins
  has_many :users, :through => :check_ins
  
  validates :home_team_id, :presence => true
  validates :away_team_id, :presence => true
  
  acts_as_commentable
end
