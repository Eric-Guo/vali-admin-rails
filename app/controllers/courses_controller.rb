class CoursesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    authorize Course
    @courses = policy_scope(Course)
  end

  def new
    @course = Course.new
    authorize @course
  end
end
