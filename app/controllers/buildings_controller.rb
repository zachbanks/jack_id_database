class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
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
    if @building.update_attributes(params[:building])
      redirect_to buildings_path, :notice => "#{@building.name} was successfully updated."
    else
      render :edit
    end
  end
  
  def destroy
    @building = Building.find(params[:id])
    msg = @building.to_s
    @building.destroy
    redirect_to buildings_path, :flash => { :success => msg }
  end
end
