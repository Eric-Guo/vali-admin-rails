class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new_user
    @user = User.new
  end

  def create_user
    @user = Company2ndRegistration.new user_params
    if @user.save
      redirect_to new_user_companies_path, notice: "User #{@user.name} created."
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :new_user
    end
  end

  private

  def user_params
    @user_params ||= params.require(:user).permit(*Company2ndRegistration::FORM_FIELDS)
  end
end
