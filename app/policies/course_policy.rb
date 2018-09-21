class CoursePolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.super_admin?
        scope.all
      elsif user.admined_vm.present?
        user_admined_vm_company_ids = user.admined_vm.companies.pluck(:id)
        user_managed_company_ids = user_admined_vm_company_ids +
                                   Company.where(managed_by_company_id: user_admined_vm_company_ids).pluck(:id)
        allow_to_see_vm_ids = VerticalMarketCompany.where(company_id: user_managed_company_ids).pluck(:vertical_market_id)
        allow_to_see_course_ids = VerticalMarketCourse.where(vertical_market_id: allow_to_see_vm_ids).pluck(:course_id)
        scope.where(id: allow_to_see_course_ids)
      elsif user.first_level_vendor?
        user_belongs_to_company_ids = user.companies.pluck(:id)
        user_managed_company_ids = user_belongs_to_company_ids +
                                   Company.where(managed_by_company_id: user_belongs_to_company_ids).pluck(:id)
        allow_to_see_vm_ids = VerticalMarketCompany.where(company_id: user_managed_company_ids).pluck(:vertical_market_id)
        allow_to_see_course_ids = VerticalMarketCourse.where(vertical_market_id: allow_to_see_vm_ids).pluck(:course_id)
        scope.where(id: allow_to_see_course_ids)
      else
        scope.none
      end
    end
  end

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

  def select_company_changed?
    internal_user? || first_level_vendor?
  end

  def delete_trainee?
    internal_user? || first_level_vendor?
  end
end
