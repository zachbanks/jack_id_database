class SessionsController < ApplicationController
  # This method will make this controller use https. This only works in test and production environments.
  force_ssl
  
  def new
  end
  
  def create
    admin = Admin.find_by_email(params[:email])
    if admin && admin.authenticate(params[:password])
      # If remember me checkbox is set ...
      if params[:remember_me]
        # Make it a permanent cookie (doesn't go away until deleted).
        cookies.permanent[:auth_token] = admin.auth_token
      else
        # Otherwise, make it a temporary cookie.
        cookies[:auth_token] = admin.auth_token
      end
     
      redirect_to_target_or_default root_url, :notice => "Logged in as #{admin}!"
    else
      flash.now.alert = "Email or password is invalid."
      render :new
    end
  end
  
  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
end
