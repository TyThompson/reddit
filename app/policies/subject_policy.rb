class SubjectPolicy < ApplicationPolicy
  def update?
    is_admin || is_mod || is_owner
  end

  def show?
    true
  end

  def destroy?
    is_admin? || is_mod? || is_owner?
  end

  def create?
    true
  end

  private

  def is_admin?
    user == record.user
  end

  def is_owner?
    user == record.user
end
