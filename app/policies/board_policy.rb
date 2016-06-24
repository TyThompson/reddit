class BoardPolicy < ApplicationPolicy
  def update?
    is_admin?
  end

  def destroy?
     is_admin?
  end

end
