class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @university = University.find(params[:university_id])
    @courses = @university.courses.order(:name)
  end

  def show
  end
end
