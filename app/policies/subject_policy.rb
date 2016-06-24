class SubjectPolicy < ApplicationPolicy
  def destroy?
    is_owner? || is_admin?
  end

  def update?
    is_admin? || is_owner?
  end

end
