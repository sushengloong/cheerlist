class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, :polymorphic => true
  
  CHECKED_IN_GAME = 1 #target --> model check_in
  COMMENTED_IN_GAME = 2 #target --> model comment
  
  class << self
    def add(user, activity_type, target)
      return false if user.blank? or activity_type.blank? or target.blank?
      activity = Activity.new(:user => user, :activity_type => activity_type, :target => target)
      activity.save!
    end
  end
end
