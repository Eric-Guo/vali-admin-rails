class CompanyPolicy < ApplicationPolicy
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
        user.admined_vm.companies
      elsif user.first_level_vendor?
        user_belongs_to_company_ids = user.companies.pluck(:id)
        user_managed_company_ids = user_belongs_to_company_ids +
                                   Company.where(managed_by_company_id: user_belongs_to_company_ids).pluck(:id)
        scope.where(id: user_managed_company_ids)
      else
        scope.none
      end
    end
  end

  def index?
    internal_user? || first_level_vendor?
  end

  def approve?
    internal_user?
  end

  def companies_list_description
    if user.super_admin?
      I18n.t('ui.list_all_companies')
    elsif user.admined_vm.present?
      I18n.t('ui.list_vm_companies')
    else
      I18n.t('ui.no_access_list')
    end
  end
end
