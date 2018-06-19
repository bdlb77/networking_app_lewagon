class ContactsController < ApplicationController

  before_action :find_contact, only: [:show, :edit, :update, :destroy]
  # before_action :find_user, only: [:create]
  before_action :set_contacts, only: [:index]

  def index
    if params[:query].present?
      set_contacts
    end

    if params[:location_id].present?
      find_location_for_contact
    end

    if params[:tag_id].present?
      find_tag_for_contact
    end
  end


  def new
    @contact = Contact.new
    @contact.user = current_user
    @milestone = Milestone.new
    @location = Location.new
    @subject = Subject.new
    @tag = Tag.new
    @user = current_user
  end


  def show
  end

  def create
    # @contact.user_id = current_user
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    # if (@contact_first_name.blank? && @contact_last_name.blank?)

    if @contact.save!
      flash[:alert] = "Your contact has been set!"
      @locations = Location.all
      @have_location = false
        @locations.each do |l|
          if l.title == @contact.first_location
            @milestone = Milestone.new(contact_id:@contact.id, contact_type: @contact.first_contact_type, location_id:l.id, note:@contact.one_note)
            @have_location = true
            @milestone.save!
          end
        end
        if @have_location == false
          @location = Location.new(title:@contact.first_location, user_id:@contact.user_id)
          if @location.save!
            @milestone = Milestone.new(contact_id:@contact.id, contact_type: @contact.first_contact_type, location_id:@location.id, note:@contact.one_note)
            @milestone.save!
          end
        end

      if @milestone.save!

      @tags = Tag.all

      if not @contact.first_tag.empty?
        @have_first_tag = false
        if @contact.first_tag != "Choose_tag"
          @tags.each do |t|
            if t.title == @contact.first_tag
              @subject1 = Subject.new(milestone_id:@milestone.id, tag_id:t.id)
              @have_first_tag = true
              @subject1.save!
            end
          end
          if @have_first_tag == false
            @tag1 = Tag.new(title:@contact.first_tag, user_id:@contact.user_id)
            @tag1.save!
            @subject1 = Subject.new(milestone_id:@milestone.id, tag_id:@tag1.id)
            @subject1.save!
          end
        end
      end

      if not @contact.second_tag.empty?
        @have_second_tag = false
        if @contact.second_tag != "Choose_tag"
          @tags.each do |t|
            if t.title == @contact.second_tag
              @subject2 = Subject.new(milestone_id:@milestone.id, tag_id:t.id)
              @have_second_tag = true
              @subject2.save!
            end
          end
          if @have_second_tag == false
            @tag2 = Tag.new(title:@contact.second_tag, user_id:@contact.user_id)
            @tag2.save!
            @subject2 = Subject.new(milestone_id:@milestone.id, tag_id:@tag2.id)
            @subject2.save!
          end
        end
      end
      else
        render :edit
      end
      redirect_to contact_path(@contact)
    else
      render :edit
    end
  end

  def edit
    @user = current_user
  end

  def update
    if @contact.update(contact_params)
      flash[:alert] = " Your contact has been updated!"
      redirect_to contact_path(@contact)
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to user_contacts_path
  end

private
  def set_contacts
    @contacts = Contact.search_by_first_name_and_last_name(params[:query])
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


  def find_contact
    @contact = Contact.find(params[:id])
  end

  def find_user
    @user = User.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :company, :username, :email, :phone_number, :date_of_birth, :first_contact_type, :first_location, :first_tag, :second_tag, :one_note)
  end

  def milestone_params
    params.require(:milestone).permit(:note, :contact_type, :last_location, :last_tag_two, :last_tag)
  end

  def tag_params
    params.require(:tag).permit(:title)
  end

   def subject_params
    params.require(:subject).permit(:tag_id, :milestone_id)
  end

end
