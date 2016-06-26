class SubjectPolicy < ApplicationPolicy
  def destroy?
    is_owner? || is_admin? || is_mod?
  end

  def update?
    is_admin? || is_owner? || is_mod?
  end

private
  def is_mod?
    Board.where(id: record.board_id).pluck(:mod_id).include? user.id
  end

end
