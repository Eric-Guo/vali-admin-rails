class VendorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @vendor_list_description = if current_user.super_admin?
      I18n.t('ui.list_unlocked_managed_user', managed: '所有的')
    elsif current_user.admined_vm.present?
      I18n.t('ui.list_unlocked_managed_user', managed: current_user.admined_vm.name)
    else
      I18n.t('ui.no_access_list')
    end
    @users = current_user.managed_users.where(locked_at: nil)
  end

  def pending
    @vendor_list_description = if current_user.super_admin?
      I18n.t('ui.list_locked_managed_user', managed: '所有的')
    elsif current_user.admined_vm.present?
      I18n.t('ui.list_locked_managed_user', managed: current_user.admined_vm.name)
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

  def lock_access
    @user = current_user.managed_users.find params[:id]
    @user.lock_access!
    redirect_to vendors_path, status: :found, notice: "User #{@user.name} locked."
  end

  def new_user
    @user = User.new
  end

  def create_user
    company = current_user.companies.find user_params[:create_user_via_company_id]
    user = User.create!(user_params)
    CompanyUser.find_or_create_by!(company: company, user: user)
    redirect_to vendors_path, status: :found, notice: 'User created.'
  end

  private

  def user_params
    @user_params ||= params.require(:user).permit(:create_user_via_company_id,
      :email, :password, :password_confirmation,
      :name, :title, :phone)
  end
end
