class StaticController < ApplicationController
  before_action :authenticate_user!
  def landing
    @universities = current_user.universities
    @messages = current_user.messages.order(:created_at).reverse_order.limit(3)
  end
end
