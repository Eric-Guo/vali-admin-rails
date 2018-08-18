class HomeController < ApplicationController
  def index
    @circulars = Circular.order(id: :desc)
  end
end
