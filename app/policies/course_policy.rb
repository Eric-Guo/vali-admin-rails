class CoursePolicy < ApplicationPolicy
  def index?
    internal_user?
  end

  def new?
    internal_user?
  end
end
