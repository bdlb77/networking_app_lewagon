class LocationsController < ApplicationController
  before_action :set_milestone, only: [:create, :new, :show, :update]
  before_action :find_user, only: [:create]
  before_action :find_location, only: [:show, :edit]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
     @location = Location.new(location_params)
     @location.user = @user
     @location.save
     redirect_to milestone_locations_path
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to milestone_locations_path
    else
      render :edit
    end
  end

  private

  def find_location
  @location = Location.find(params[:id])
  end

  def set_milestone
    @milestone = Milestone.find(params[:milestone_id])
  end
  def location_params
    params.require(:location).permit(:title)
  end
  def find_user
    @user = User.find(params[:id])
  end
end
