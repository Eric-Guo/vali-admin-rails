class VendorsController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize User
    @vendor_list_description = policy(User).vendor_unlocked_list_description
    @users = policy_scope(User).where(locked_at: nil)
  end

  def pending
    authorize User
    @vendor_list_description = policy(User).vendor_locked_list_description
    @users = policy_scope(User).where.not(locked_at: nil)
  end

  def unlock_access
    @user = policy_scope(User).find params[:id]
    @user.unlock_access!
    redirect_to vendors_path, status: :found, notice: "User #{@user.name} unlocked."
  end

  def lock_access
    @user = policy_scope(User).find params[:id]
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
