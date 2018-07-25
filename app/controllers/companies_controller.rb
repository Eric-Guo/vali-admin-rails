class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new_user
    @user = User.new
  end

  def create_user
    @c2r = Company2ndRegistration.new user_params
    @c2r.save
  end

  private

  def user_params
    @user_params ||= params.require(:user).permit(*Company2ndRegistration::FORM_FIELDS)
  end
end
