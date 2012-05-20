class JackIdsController < ApplicationController
  def index
    @jack_ids = JackId.all
  end
  
  def new
    @jack_id = JackId.new
  end
  
  def create
    @jack_id = JackId.new(params[:jack_id])
    # TODO: Remove.
    @jack_id.location = Location.first
    
    if @jack_id.save
      redirect_to jack_ids_path, :notice => "Jack ID successfully added."
    else
      render :new
    end
  end
  
  def edit
    @jack_id = JackId.find(params[:id])
  end
  
  def update
    @jack_id = JackId.find(params[:id])
    if @jack_id.update_attributes(params[:jack_id])
      redirect_to jack_ids_path, :notice => "Jack ID successfully updated."
    else
      render :edit
    end
  end
  
  def destroy
    @jack_id = JackId.find(params[:id])
    @jack_id.destroy
    redirect_to jack_ids_path, :flash => { :success => "Jack ID was successfully deleted."}
  end
end
