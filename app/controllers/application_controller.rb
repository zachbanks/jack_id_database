class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private 
  
  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def authorize
    redirect_to login_url, alert: "Not authorized. Please login." if current_admin.nil?
  end
  
  helper_method :current_admin
end
