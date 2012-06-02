class LocationsController < ApplicationController
  include ActiveSupport::Inflector
  before_filter :login_required
  
  def index
    @locations = Location.page(params[:page]).per(15)
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
    if params['delete_location']
      # Delete Location button was clicked.
      destroy # Calls this controllers destroy method to delete the record.
    elsif @location.update_attributes(params[:location])
      redirect_to location_path(@location), :notice => "#@location was successfully updated."
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
  
  
  # Displays pdf of floor plan for location's building and floor in browser. If floor plan cannot be found, it renders a 404 error.
  # The floor and building are determined using the passed in location instance.
  #
  # For this method to work, floor plans must be placed in the public directory inside a directory for each 
  # building with the file name in the format <ordinal number>_floor.pdf. Ex: 1st_floor.pdf, 5th_floor.pdf, etc.
  # The building directory must the name of the building instance in the database in underscore format. Ex: oscar_ritchie 
  # Ex: Floor plans for 1st floor Oscar Ritchie are found in /public/oscar_ritchie/1st_floor.pdf
  #
  # @param location [Location] Location instance that will be used to choice which floor plan to display.
  def display_floor_plan
    location = Location.find(params[:id])
    
    # Find name, strip whitespace and convert it to underscore format.
    building_name = location.building.name.gsub(' ', '').underscore
    
    floor = location.room[0].to_i # Gets first character of room number and convert to number.
    file_path = "#{Rails.root}/public/floor_plans/#{building_name}/#{ordinalize(floor)}_floor.pdf"
    
    if has_floor_plan?(location)
      send_file(file_path, :type => 'application/pdf', :disposition => 'inline') # Show pdf in browser.
    else
      render :status => :not_found
    end 
  end
  
  private
  
  # Determines if a floor plan exists for location instance.
  # @param location [Location] Location instance that will be determine if floor plan exists.
  # @return [boolean] Returns true if floor plan exists for location, otherwise returns false.
  def has_floor_plan?(location)
    # Find name, strip whitespace and convert it to underscore format.
    building_name = location.building.name.gsub(' ', '').underscore
    
    floor = location.room[0].to_i # Gets first character of room number and convert to number.
    file_path = "#{Rails.root}/public/floor_plans/#{building_name}/#{ordinalize(floor)}_floor.pdf"
    
    File.exists?(file_path)
  end
  
  helper_method :has_floor_plan?
end
