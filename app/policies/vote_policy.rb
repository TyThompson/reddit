class VotePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
  end

  def show?
  end

  def create?
  end

  def new?
  end

  def update?
  end

  def edit?
    update?
  end

  def destroy?
  end

  def is_admin?
    user.admin?
  end

  def is_owner?
    user == record.user
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
