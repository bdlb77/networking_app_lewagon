class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_contacts, only: [:home]
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
      @location_names = Location.all
    end
  end
  private 
  
  def set_contacts 
    @contacts = Contact.search_by_first_name_and_last_name(params[:query])
  end

  def tag_titles
    @tag_names = []
    @tags = Tag.all
    @milestones = Milestone.all
    @subjects = Subject.all
    @contact_tags = []
    
    @contacts.each do |c|  
      @milestones.each do |m|
        if c.id == m.contact_id
          @subjects.each do |s|
            if m.id == s.milestone_id
              tag.id = s.tag_id
              @contact_tags << tag.id
            end
          end
        end
      end
    end
    @contact_tags.each do |ct|
      @tags.each do |t|
        if ct == t.id
          @tag_names << t
        end
      end
    end
  end

  def location_titles
    @location_ids = []
    @location_names =[]
    @locations = Location.all
    @milestones = Milestone.all
    @ubjects = Subject.all
  
    @contacts.each do |c|
      @milestones.each do |m|
        if c.id == m.contact_id
          location = m.location_id
          @location_ids << location
        end
      end
    end
    raise

    @location_ids.each do |lt|
      @locations.each do |l|
        if lt == l.id
          @location_names << l
        end
      end
    end
  end

  def recent_activity
    @sorted_milestones = Milestone.all
    @sorted_milestones.sort_by { |milestone| milestone.updated_at }
    @sorted_milestones.first(3)
  end
end
