class TutorsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_course
  def index
    @tutors = @course.tutors
  end

  def create
    current_user.tutors @course
    respond_to do |format|
      format.html {
        flash[:success] = "Tutoring #{@course.name}"
        redirect_to courses_path(@course.university)
      }
    end
  end

  def destroy
    current_user.stop_tutoring @course

    respond_to do |format|
      format.html {
        flash[:success] = "You're not tutoring #{@course.name} now"
        redirect_to courses_path(@course)
      }
    end
  end

  private
  def get_course
    @course = Course.find(params[:course_id])
  end
end
