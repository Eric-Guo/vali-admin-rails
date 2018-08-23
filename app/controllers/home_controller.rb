class HomeController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    authorize Circular, :public_home?
    @circulars = Circular.order(id: :desc)
  end
end
