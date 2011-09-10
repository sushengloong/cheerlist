class CheckInObserver < ActiveRecord::Observer
  def after_create(check_in)
    Activity.add(check_in.user, Activity::CHECKED_IN_GAME, check_in)
  end
end
