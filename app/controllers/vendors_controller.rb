class VendorsController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize User
    @vendor_list_description = policy(User).vendor_unlocked_list_description
    @users = policy_scope(User)
  end

  def new_user
    @user = User.new
    @new_user_random_password = SecureRandom.hex(10)
    @companies = policy_scope(Company).where(id: params[:company_ids])
  end

  def create_user
    company = policy_scope(Company).find user_params[:create_user_via_company_id]
    user = User.new(user_params)
    user.skip_confirmation_notification!
    user.save
    user.lock_access!
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
