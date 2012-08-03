class AdminsController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  
  def index
    @admins = Admin.page(params[:page]).per(10)
  end

  def new
    # Allow first time user to create an admin.
    login_required unless Admin.all.count == 0
    @admin = Admin.new
  end

  def create
    # Allow first time user to create an admin.
    no_admins = Admin.all.count == 0 ? true : false
    login_required unless no_admins

    @admin = Admin.new(params[:admin])

    if @admin.save && no_admins
      redirect_to login_path, :flash => { :success => "Admin was created. Please login." }
    elsif @admin.save
      redirect_to admins_path, :flash => { :success => "#{@admin.email} has been successfully created." }
    else
      render :new
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if params['delete_admin']
      destroy
    elsif @admin.update_attributes(params[:admin])
      redirect_to admins_path, :flash => { :success => "#{@admin.email} was successfully updated." }
    else
      render :edit
    end
  end

  def destroy
    @admin = Admin.find(params[:id])

    # You can't delete your own account.
    if @admin == current_admin
      flash.now[:alert] = "You cannot delete your own account. You must have another Admin delete your account instead."
      render :edit
    else
      msg = "#{@admin.email} was successfully deleted."
      @admin.destroy
      redirect_to admins_path :flash => { :success => msg }
    end
  end
end
