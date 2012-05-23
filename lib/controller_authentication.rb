# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.
#
#   <% if logged_in? %>
#     Welcome <%= current_admin.username %>.
#     <%= link_to "Edit profile", edit_current_admin_path %> or
#     <%= link_to "Log out", logout_path %>
#   <% else %>
#     <%= link_to "Sign up", signup_path %> or
#     <%= link_to "log in", login_path %>.
#   <% end %>
#
# You can also restrict unregistered users from accessing a controller using
# a before filter. For example.
#
#   before_filter :login_required, :except => [:index, :show]
module ControllerAuthentication
  # Makes these methods helper methods in the controller that includes this module.
  def self.included(controller)
    controller.send :helper_method, :current_admin, :logged_in?, :redirect_to_target_or_default
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def logged_in?
    current_admin
  end

  def login_required
    unless logged_in?
      store_target_location
      # If the request url is the root url, it probably means they are coming to the site 
      # for the first time, so don't show a flash message.
      if request.url == root_url
        redirect_to login_url
      else
        redirect_to login_url, :alert => "You must first log in before accessing this page."
    end
    end
  end

  def redirect_to_target_or_default(default, *args)
    redirect_to(session[:return_to] || default, *args)
    session[:return_to] = nil
  end
  
  def redirect_to_or_default(target, *args)
    redirect_to(target || default, *args)
  end

  private

  def store_target_location
    session[:return_to] = request.url
  end
end