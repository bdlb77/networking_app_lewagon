class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_contacts, only: [:home]
  def home
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
    recent_activity
  end
  private 
  
  def set_contacts 
    @contacts = Contact.search_by_first_name_and_last_name(params[:query])
  end

  def tag_titles
    @tag_names = []
    @tags = Tag.all
    @tag_names = @tags.map do |tag|
      if tag.user == current_user
       tag
      end
    end
  end

  def location_titles
    @locations = Location.all
    @my_locations = @locations.map do |location|
      if location.user == current_user
        location
      end
    end
  end

  def recent_activity
    @sorted_milestones = Milestone.all
    @sorted_milestones.sort_by { |milestone| milestone.updated_at }
    @sorted_milestones.first(3)
  end
end
