class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
rescue_from ActiveRecord::RecordNotFound, :with => :render_404

rescue_from ActionController::RoutingError, :with => :render_404



def render_404
  render :template =>"error/404", :status => 404
end


private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
