class RsvpController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def update
    course = Course.find params[:course_id]
    authorize course, :rsvp?
    user = User.find params[:id]
    CourseUser.find_or_create_by!(course: course, user: user)
    redirect_to available_courses_path, status: :found, notice: "#{user.name} attend #{course.title}."
  end
end
