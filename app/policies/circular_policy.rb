class CircularPolicy < ApplicationPolicy
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
        allow_to_see_circular_ids = VerticalMarketCircular.where(vertical_market_id: allow_to_see_vm_ids).pluck(:circular_id)
        scope.where(id: allow_to_see_circular_ids)
      elsif user.first_level_vendor?
        user_belongs_to_company_ids = user.companies.pluck(:id)
        user_managed_company_ids = user_belongs_to_company_ids +
                                   Company.where(managed_by_company_id: user_belongs_to_company_ids).pluck(:id)
        allow_to_see_vm_ids = VerticalMarketCompany.where(company_id: user_managed_company_ids).pluck(:vertical_market_id)
        allow_to_see_circular_ids = VerticalMarketCircular.where(vertical_market_id: allow_to_see_vm_ids).pluck(:circular_id)
        scope.where(id: allow_to_see_circular_ids)
      else
        scope.none
      end
    end
  end

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
