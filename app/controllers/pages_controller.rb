class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_contacts, only: [:home]
  def home
    find_location_for_contact
    find_tag_for_contact
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

  def find_tag_for_contact
    @list_of_contacts = []
    @tag_milestones = []

    @tag_sub = Tag.first.subjects
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
    @milestones_for_location = Location.first.milestones
    @milestones_for_location.each do |milestone|
      @contacts_for_location << milestone.contact
    end
    @contacts_for_location
  end
end
