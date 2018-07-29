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

  def create
    @course = Course.new(course_params)
    authorize @course
    if @course.save
      redirect_to courses_path, notice: "Course #{@course.title} created."
    else
      flash[:alert] = @course.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def course_params
    @course_params ||= params.require(:course).permit(:title, :address, :capacity, :start_time, :end_time)
  end
end
