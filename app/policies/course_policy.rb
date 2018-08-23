class CoursePolicy < ApplicationPolicy
  def index?
    internal_user?
  end

  def show?
    internal_user? || first_level_vendor?
  end

  def available?
    true
  end

  def rsvp?
    true
  end

  def new?
    internal_user?
  end

  def create?
    internal_user?
  end

  def update?
    internal_user? || first_level_vendor?
  end

  def destroy?
    internal_user?
  end

  def publish?
    internal_user?
  end
end
