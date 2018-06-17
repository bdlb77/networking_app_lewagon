class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_contacts, only: [:home]
  def home
    recent_activity
    
    if params[:location_id].present?
      find_location_for_contact
    end
    if params[:tag_id].present?
      find_tag_for_contact
    end
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
  
  def set_contacts 
    @contacts = Contact.search_by_first_name_and_last_name(params[:query])
  end

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

  def find_tag_for_contact
    @list_of_contacts = []
    @tag_milestones = []
    @tag = Tag.find(params[:tag_id])
    @tag_sub = @tag.subjects
    @tag_sub.each do |tsub|
      @tag_milestones << tsub.milestone
    end
    @tag_milestones.each do |milestone|
      @list_of_contacts << milestone.contact
    end
    @list_of_contacts
  end
  def find_location_for_contact
    @contacts_for_location = []
    @location = Location.find(params[:location_id])
    @milestones_for_location = @location.milestones
    @milestones_for_location.each do |milestone|
      @contacts_for_location << milestone.contact
    end
    @contacts_for_location
  end
end
