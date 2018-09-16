class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_and_authorize_course, only: %i[show update publish select_company_changed delete_trainee]
  before_action :set_course_users, only: %i[show update delete_trainee]
  after_action :verify_authorized

  def index
    authorize Course
    @courses = policy_scope(Course).includes(:vertical_markets)
  end

  def show
    @users = User.none
  end

  def available
    authorize Course
    @courses = policy_scope(Course).includes(:vertical_markets).available
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
    user = policy_scope(User).find course_params[:attend_user_id]
    CourseUser.find_or_create_by!(course: @course, user: user)
  end

  def destroy
    @course = policy_scope(Course).not_published.find(params[:id])
    authorize @course
    @course.destroy
    redirect_to courses_path, status: :found, notice: 'Course destroy.'
  end

  def publish
    @course.update_attributes!(published: true)
    redirect_to courses_path, status: :found, notice: 'Course published.'
  end

  def select_company_changed
    company = policy_scope(Company).find(params[:company_id])
    @users = company.users
  end

  def delete_trainee
    user = policy_scope(User).find course_params[:attend_user_id]
    CourseUser.find_by(course: @course, user: user)&.destroy
    render action: :update
  end

  private

  def set_and_authorize_course
    @course = policy_scope(Course).find(params[:id])
    authorize @course
  end

  def set_course_users
    @course_users = if current_user&.super_admin?
      @course.users
    else
      @course.users.where(id: policy_scope(User).pluck(:id))
    end
  end

  def course_params
    @course_params ||= params.require(:course).permit(:title, :address, :body, :capacity, :start_time, :end_time,
      :attend_user_id, vertical_market_ids: [])
  end
end
