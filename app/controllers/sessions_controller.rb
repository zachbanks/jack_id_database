class SessionsController < ApplicationController
  # This method will make this controller use https. This only works in test and production environments.
  force_ssl
  
  def new
  end
  
  def create
    admin = Admin.find_by_username(params[:username])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to_target_or_default root_url, :notice => "Logged in as #{admin.username}!"
    else
      flash.now.alert = "Username or password is invalid."
      render :new
    end
  end
  
  def destroy
    session[:admin_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
