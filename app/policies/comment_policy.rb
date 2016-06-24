class CommentPolicy < ApplicationPolicy
  def edit?
    update?
  end

  def update?
    is_admin? || user_comment_update_allowed?
  end

  def destroy?
    is_admin? || user_comment_update_allowed?
  end

# helper methods

  def comment_not_old?
    Time.now < (record.created_at.to_time + 1.hours)
  end

  def user_comment_update_allowed?
    is_owner? && comment_not_old?
  end
end
