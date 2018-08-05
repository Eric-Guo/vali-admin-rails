class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:available]
  after_action :verify_authorized

  def index
    authorize Course
    @courses = policy_scope(Course)
  end

  def show
    @course = policy_scope(Course).find(params[:id])
    authorize @course
  end

  def available
    authorize Course
    @courses = policy_scope(Course).available
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

  def update
    @course = Course.find params[:id]
    authorize @course
    @course.update(course_params)
  end

  def destroy
    @course = policy_scope(Course).not_published.find(params[:id])
    authorize @course
    @course.destroy
    redirect_to courses_path, status: :found, notice: 'Course destroy.'
  end

  def publish
    @course = policy_scope(Course).not_published.find(params[:id])
    authorize @course
    @course.update_attributes!(published: true)
    redirect_to courses_path, status: :found, notice: 'Course published.'
  end

  private

  def course_params
    @course_params ||= params.require(:course).permit(:title, :address, :capacity, :start_time, :end_time,
      attend_user_ids: [])
  end
end
