class UniversitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @universities = University.all
  end

  # Adds a  user to a university. Requires authentication, and acts on the
  # current user.
  def add_user
    university = University.find(params[:university_id])
    university.users << current_user

    respond_to do |format|
      if university.save
        format.html { 
          flash[:success] = "Successfully joined #{university.name}!"
          redirect_to :universities 
        }
        format.json { render json: success }
      end
    end
  end

  def remove_user
    university = University.find(params[:university_id])
    university.users.destroy current_user

    respond_to do |format|
      format.html {
          flash[:success] = "Successfully left #{university.name}!"
          redirect_to :universities 
      }
    end
  end
end
