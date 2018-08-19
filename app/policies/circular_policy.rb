class CircularPolicy < ApplicationPolicy
  def public_home?
    true
  end

  def index?
    internal_user?
  end

  def new?
    internal_user?
  end

  def create?
    internal_user?
  end

  def destroy?
    internal_user?
  end
end
