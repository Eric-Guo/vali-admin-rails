class CoursesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    authorize Course
    @courses = policy_scope(Course)
  end
end
