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
end
