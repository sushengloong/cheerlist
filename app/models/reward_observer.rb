class RewardObserver < ActiveRecord::Observer
  observe CheckIn
  
  def after_create(check_in)
    profile = check_in.user.profile
    if profile.points.nil?
      profile.points = 100
    else
      profile.points += 100
    end
    profile.save!
  end
end
