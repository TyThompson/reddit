class BoardPolicy < ApplicationPolicy
  def update?
    is_admin?
  end

  # def show?
  #   true
  # end

  # def destroy?
  #   is_admin?
  # end

  # def create?
  #   true
  # end
  def is_board_mod?
    current_user == @board.mod_id
  end
end
