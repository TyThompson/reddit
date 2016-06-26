class CommentPolicy < ApplicationPolicy
  def edit?
    update?
  end

  def update?
    is_admin? || user_comment_update_allowed? || is_mod?
  end

  def destroy?
    is_admin? || user_comment_update_allowed? || is_mod?
  end

# helper methods
private

  def is_mod?
    subject_board_id = Subject.where(id: record.subject_id).pluck(:board_id).first
    Board.where(id: subject_board_id).pluck(:mod_id).include? user.id
  end

  def comment_not_old?
    Time.now < (record.created_at.to_time + 1.hours)
  end

  def user_comment_update_allowed?
    is_owner? && comment_not_old?
  end
end
