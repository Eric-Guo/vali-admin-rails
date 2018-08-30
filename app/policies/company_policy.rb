class CompanyPolicy < ApplicationPolicy
  def index?
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
