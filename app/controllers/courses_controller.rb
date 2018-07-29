class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = policy_scope(Course)
  end
end
