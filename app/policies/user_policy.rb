class UserPolicy < ApplicationPolicy
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
        user.admined_vm.users
      else
        scope.none
      end
    end
  end

  def index?
    internal_user?
  end

  def pending?
    internal_user?
  end

  def new_user?
    first_level_vender?
  end

  def vendor_unlocked_list_description
    if user.super_admin?
      I18n.t('ui.list_unlocked_managed_user', managed: '所有的')
    elsif user.admined_vm.present?
      I18n.t('ui.list_unlocked_managed_user', managed: user.admined_vm.name)
    else
      I18n.t('ui.no_access_list')
    end
  end

  def vendor_locked_list_description
    if user.super_admin?
      I18n.t('ui.list_locked_managed_user', managed: '所有的')
    elsif user.admined_vm.present?
      I18n.t('ui.list_locked_managed_user', managed: user.admined_vm.name)
    else
      I18n.t('ui.no_access_list')
    end
  end

  def system_role_name
    return unless user.present?
    if user.super_admin?
      ActionController::Base.helpers.content_tag :p, '系统管理员', class: 'app-sidebar__user-designation'
    elsif user.admined_vm.present?
      ActionController::Base.helpers.content_tag :p, "#{user.admined_vm.name}管理员", class: 'app-sidebar__user-designation'
    end
  end
end
