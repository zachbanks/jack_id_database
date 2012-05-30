class LocationsController < ApplicationController
  before_filter :login_required
  def index
    @locations = Location.paginate(:page => params[:page], :per_page => 15)
  end
  
  def new
    @location = Location.new(:jack_ids => [JackId.new])
  end
  
  def create
    @location = Location.new(params[:location])
    
    if @location.save
      redirect_to locations_path, :notice => "#@location was successfully added."
    else
      render :new
    end
  end
  
  def show
    @location = Location.find(params[:id])
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
    msg = "#{@location.to_s} was successfully deleted."
    @location.destroy
    redirect_to locations_path, :flash => { :success => msg }
  end
end
