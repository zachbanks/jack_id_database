class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end
  
  def new
    @location = Location.new
  end
  
  def create
    @location = Location.new(params[:location])
    # TODO: Fix and remove.
    #@location.building = Building.find_by_name('Bowman')
    if @location.save
      redirect_to locations_path, :notice => "#@location was successfully added."
    else
      render :new
    end
  end
  
  def edit
    @location = Location.find(params[:id])
  end
  
  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to locations_path, :notice => "#@location was successfully updated."
    else
      render :edit
    end
  end
  
  def destroy
    @location = Location.find(params[:id])
    msg = @location.to_s
    @location.destroy
    redirect_to locations_path, :flash => { :success => msg }
  end
end
