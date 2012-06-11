class AdminsController < ApplicationController
  before_filter :login_required
  
  def index
    @admins = Admin.page(params[:page]).per(10)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])

    if @admin.save
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
    msg = "#{@admin.email} was successfully deleted."
    @admin.destroy
    redirect_to admins_path :flash => { :success => msg }
  end
end
