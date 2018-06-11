class LocationsController < ApplicationController
  before_action :set_milestone, only: [:create, :new, :show, :update]
  before_action :set_user
  def index
    @locations = Location.all
  end

  # def new
  #   @location = Location.new
  # end

  # def show
  #   @location = Location.find(params[:id])
  # end

  def create
     @location = Location.new(location_params)
     @location.user = current_user
     @location.milestone = @milestone
     @location.save
     redirect_to milestone_locations_path
  end

  def edit
  end

  def update
    @location = Location.find(params[:id])
    if @location.save
      @location.update(location_params)
      redirect_to milestone_locations_path
    else
      render :edit
    end
  end
   private

  def set_milestone
    @milestone = Milestone.find(params[:milestone_id])
  end
  def location_params
    params.require(:location).permit(:title)
  end
  def set_user
    @user = current_user
  end
end
