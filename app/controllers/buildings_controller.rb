class BuildingsController < ApplicationController
  before_filter :login_required
  
  def index
    @buildings = Building.page(params[:page]).per(10)
  end
  
  def new
    @building = Building.new
  end
  
  def create
    @building = Building.new(params[:building])
    if @building.save
      redirect_to buildings_path, :notice => "#{@building.name} was successfully added."
    else
      render :new
    end
  end
  
  def edit
    @building = Building.find(params[:id])
  end
  
  def update
    @building = Building.find(params[:id])
    if params['delete_building']
        # Delete Building button was clicked.
      destroy # Calls this controllers destroy method to delete the record.
    elsif @building.update_attributes(params[:building])
      redirect_to buildings_path, :notice => "#{@building.name} was successfully updated."
    else
      render :edit
    end
  end
  
  def destroy
    @building = Building.find(params[:id])
    msg = "#{@building.to_s} was succesfully deleted."
    @building.destroy
    redirect_to buildings_path, :alert => msg 
  end
end
