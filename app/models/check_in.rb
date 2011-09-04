class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :location
  
  validates :user_id, :presence => true
  validates :game_id, :presence => true
  validates :location_id, :presence => true
end
