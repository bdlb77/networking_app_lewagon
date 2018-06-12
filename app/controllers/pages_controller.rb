class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_contacts, only: [:home]
  def home
    if @contacts.present?
      @tags = @contacts.tags.each { |tag| tag }
    else
      @tags = Tag.all
    end
    
    if @contacts.present?
      @locations = @contacts.locations.each { |location| location }
    else
      @locations = Location.all
    end
  end
  
  private 
  def set_contacts 
    @contacts = Contact.search_by_first_name_and_last_name(params[:query])
  end

end
