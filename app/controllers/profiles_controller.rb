class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user

  def show
  end

  private
  def get_user
    @user = User.find params[:user_id]
  end
end
