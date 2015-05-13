class TutorsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_course
  def index
    @tutors = @course.tutors
  end

  def create
    @course.tutors << current_user
  end

  private
  def get_course
    @course = Course.find(params[:course_id])
  end
end
