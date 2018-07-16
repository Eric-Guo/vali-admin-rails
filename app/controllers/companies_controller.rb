class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new_user
    @user = User.new
  end
end
