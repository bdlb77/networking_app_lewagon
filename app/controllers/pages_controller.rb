class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    recent_activity
    

    if params[:query].present?
      tag_titles
    else
      @tag_names = Tag.all
    end

    if params[:query].present?
      location_titles
    else
      @my_locations = Location.all
    end
  end
  
  private 
  
  def tag_titles
    @tag_names = []
    @tags = Tag.all
    @tags.each do |tag|
      if tag.user == current_user
        @tag_names << tag
      end
    end
  end

  def location_titles
    @my_locations = []
    @locations = Location.all
    @locations.each do |location|
      if location.user == current_user
        @my_locations << location 
      end
    end
  end

  def recent_activity
    @sorted_milestones = Milestone.all
    @sorted_milestones.sort_by { |milestone| milestone.updated_at }
    @sorted_milestones.first(3)
  end

end
