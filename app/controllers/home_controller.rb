class HomeController < ApplicationController
  after_action :verify_authorized

  def index
    authorize Circular
    @circulars = Circular.order(id: :desc)
  end
end
