class CircularsController < ApplicationController
  after_action :verify_authorized

  def index
    authorize Circular
    @circulars = policy_scope(Circular)
  end
end
