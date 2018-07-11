class VendorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @vendor_list_description = if current_user.super_admin?
      '下表列出了所有代理商'
    elsif current_user.admined_vm.present?
      "下表列出了#{current_user.admined_vm.name}代理商"
    else
      I18n.t('ui.no_access_list')
    end
    @users = current_user.managed_users.where(locked_at: nil)
  end

  def pending
    @vendor_list_description = if current_user.super_admin?
      '下表列出了所有锁定的代理商'
    elsif current_user.admined_vm.present?
      "下表列出了#{current_user.admined_vm.name}被锁定的代理商"
    else
      I18n.t('ui.no_access_list')
    end
    @users = current_user.managed_users.where.not(locked_at: nil)
  end

  def unlock_access
    @user = current_user.managed_users.find params[:id]
    @user.unlock_access!
    redirect_to vendors_path, status: :found, notice: "User #{@user.name} unlocked."
  end
end
