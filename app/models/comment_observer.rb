class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    Activity.add(comment.user, Activity::COMMENTED_IN_GAME, comment)
  end
end
