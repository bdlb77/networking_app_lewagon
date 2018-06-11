class ContactsController < ApplicationController

  before_action :find_contact, only: [:show, :edit, :update, :destroy]

  def index
     # @contacts = policy_scope(Contact).order(:desc)
    if user.blank?
      @contacts = nil
    else
      @contacts = Contact.all
      @contacts.each do |c|
        c.user = current_user
      end
    end
  end


  def new
    @user = current_user
    @contact = Contact.new
    @contact.user = current_user

    @milestone = Milestone.new
    @milestone.contact_id = @contact.id

    @locations = Location.all
    @location = Location.new
    @milestone.location_id = @location.id

    @subject = Subject.new
    @subject.milestone_id = @milestone.id

    @tags = Tag.all
    @tags.each do |t|
      if t == @subject
        @subject.tag_id = t.id
      else
        @tag = Tag.new
        @tag.title = @subject.name
        @subject.tag_id = @tag.id
      end
    end
  end


  def show
    @milestones = Milestone.where(contact_id: params[:contact_id])
    @subject = []
    @milestones.each do |m|
      current_tags = subject.where(milestone_id: params[:milestone_id])
      @subject << current_tags
    end
    @locations = []
    @milestones.each do |m|
      current_locations = m.location_id
      @locations << current_locations
    end
    @contact.user = current_user
  end

  def create
    @contact.user = current_user
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_show_path(@contact)
    else
      render :edit
    end

    @milestone = Milestone.new(milestone_params)
    if @milestone.save
      redirect_to contacts_show_path(@contact)
    else
      render :edit
    end

    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to contacts_show_path(@contact)
    else
      render :edit
    end

    @locations = Location.all
    @locations.each do |l|
      if l == @location
         @milestone.location_id = l.id
      else
        @location = Location.new(location_params)
        if @location.save
          redirect_to contacts_show_path(@contact)
        else
          render :new
        end
      end
    end
  end

  def edit
  end

  def update
    @contact.update(contact_params)
    if @contact.save
      redirect_to contact_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end
end

private

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :company, :username, :email, :phone_number, :date_of_birth)
  end

  def milestone_params
    params.require(:milestone).permit(:notes, :contact_type)
  end

  def subject_params
    params.require(:subject).permit(:name)
  end

  def location_params
    params.require(:location_params).permit(:title)
  end
