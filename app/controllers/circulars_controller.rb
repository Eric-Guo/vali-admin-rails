class CircularsController < ApplicationController
  after_action :verify_authorized

  def index
    authorize Circular
    @circulars = policy_scope(Circular)
  end

  def new
    @circular = Circular.new
    authorize @circular
  end

  def create
    @circular = Circular.new(circular_params)
    authorize @circular
    if @circular.save
      redirect_to circulars_path, notice: "Circular #{@circular.title} created."
    else
      flash[:alert] = @circular.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @circular = policy_scope(Circular).find(params[:id])
    authorize @circular
    @circular.destroy
    redirect_to circulars_path, status: :found, notice: 'Circular destroy.'
  end

  private

  def circular_params
    @circular_params ||= params.require(:circular).permit(:title, :body, vertical_market_ids: [])
  end
end
