class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_and_authorize_company, only: %i[approve freeze]
  after_action :verify_authorized

  def index
    authorize Company
    @companies_list_description = policy(Company).companies_list_description
    @companies = policy_scope(Company).includes(:vertical_markets)
  end

  def new_2nd_vendor
    @user = User.new
    authorize @user
  end

  def create_2nd_vendor
    @user = Company2ndRegistration.new user_params
    authorize @user
    if @user.save
      redirect_to new_2nd_vendor_companies_path, notice: "User #{@user.name} created."
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :new_2nd_vendor
    end
  end

  def approve
    @company.update_attributes(approved_at: Time.current)
    @company.users.map(&:unlock_access!)
    @company.users.each do |user|
      user.update_attributes(confirmed_at: Time.current)
    end
    redirect_to companies_path, status: :found, notice: "Company #{@company.name} approved."
  end

  def freeze
    @company.update_attributes(approved_at: nil)
    @company.users.map(&:lock_access!)
    redirect_to companies_path, status: :found, notice: "Company #{@company.name} freezen."
  end

  private

  def set_and_authorize_company
    @company = policy_scope(Company).find params[:id]
    authorize @company
  end

  def user_params
    @user_params ||= params.require(:user).permit(*(Company2ndRegistration::FORM_FIELDS - [:vm_ids] + [vm_ids: []]))
  end
end
