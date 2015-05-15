class StaticController < ApplicationController
  before_action :authenticate_user!
  def landing
    @universities = current_user.universities
  end
end
