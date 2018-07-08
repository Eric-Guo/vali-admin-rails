class VendorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @vendor_list_description = if current_user.super_admin?
      users = User.all
      '下表列出了所有代理商'
    elsif admined_vm.present?
      users = admined_vm.users
      "下表列出了#{admined_vm.name}代理商"
    else
      users = User.none
      I18n.t('ui.no_access_list')
    end
    @users = users.where(locked_at: nil)
  end

  def pending
    @vendor_list_description = if current_user.super_admin?
      users = User.all
      '下表列出了所有锁定的代理商'
    elsif admined_vm.present?
      users = admined_vm.users
      "下表列出了#{admined_vm.name}被锁定的代理商"
    else
      users = User.none
      I18n.t('ui.no_access_list')
    end
    @users = users.where.not(locked_at: nil)
  end

  private

  def admined_vm
    @admined_vm ||= VerticalMarket.find_by admin: current_user
  end
end
