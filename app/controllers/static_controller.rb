class StaticController < ApplicationController
  before_action :authenticate_user!
  def landing
  end
end
