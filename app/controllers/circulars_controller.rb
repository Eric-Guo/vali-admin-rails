class CircularsController < ApplicationController
  after_action :verify_authorized

  def index
    authorize Circular
    @circulars = policy_scope(Circular)
  end

  def destroy
    @circular = policy_scope(Circular).find(params[:id])
    authorize @circular
    @circular.destroy
    redirect_to circulars_path, status: :found, notice: 'Circular destroy.'
  end
end
