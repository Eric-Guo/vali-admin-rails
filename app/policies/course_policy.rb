class CoursePolicy < ApplicationPolicy
  def index?
    user&.super_admin? || user&.admined_vm.present?
  end
end
