class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_and_authorize_company, only: %i[approve approve_vm freeze]
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
    if current_user.admined_vm.present?
      vmc = @company.vertical_market_companies.find_by(vertical_market_id: current_user.admined_vm.id)
      vmc.update_attributes(approved_at: Time.current)
    end
    render json: { notice: "Company #{@company.name} approved." }
  end

  def approve_vm
    if current_user.admined_vm.present?
      vmc = @company.vertical_market_companies.find_by(vertical_market_id: current_user.admined_vm.id)
      vmc.update_attributes(approved_at: Time.current)
    end
    render json: { notice: "Company #{@company.name} VM approved." }
  end

  def freeze
    @company.update_attributes(approved_at: nil)
    @company.users.map(&:lock_access!)
    if current_user.admined_vm.present?
      vmc = @company.vertical_market_companies.find_by(vertical_market_id: current_user.admined_vm.id)
      vmc.update_attributes(approved_at: nil)
    end
    render json: { notice: "Company #{@company.name} freezen." }
  end

  private

  def set_and_authorize_company
    @company = policy_scope(Company).find_by name: params[:name]
    authorize @company
  end

  def user_params
    @user_params ||= params.require(:user).permit(*(Company2ndRegistration::FORM_FIELDS - [:vm_ids] + [vm_ids: []]))
  end
end
