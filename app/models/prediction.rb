class Prediction < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  
  validates :user_id, :presence => true
  validates :game_id, :presence => true
  validates :home_score, :presence => true
  validates :away_score, :presence => true
end
