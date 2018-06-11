class ContactsController < ApplicationController
  before_action :find_contact, only: [:show, :create, :edit,  :update, :destroy]

  def index
     # @contacts = policy_scope(Contact).order(:desc)
    if contact.blank?
      @contacts = Contact.all
    else
      @contacts = Contact.all
      @contact.each do |c|
        c.user = current_user
      end
    end
  end


  def new
    @contact = Contact.new
    @contact.user = current_user

    @milestone = Milestone.new
    @milestone.contact = @contact

    @locations = Location.all
    @location = Location.new
    @location.milestone_id = @milestone.id

    @tags = Tag.all
    @tag = Tag.new
    @tag.milestone_id = @milestone.id
  end

  def show
    @milestones = Milestone.where(contact_id: params[:contact_id])
     @tags = []
    @milestones.each do |m|
      current_tags = Tag.where(milestone_id: params[:milestone_id])
      @tags << current_tags
    end
     @locations = []
    @milestones.each do |m|
      current_locations = Location.where(milestone_id: params[:milestone_id])
      @locations << current_locations
    end
    if contact.blank?
      @contact.user = nil
    else
      @contact.each do |c|
        c.user = current_user
      end
    end
  end

  def create
    if contact.blank?
      @contact.user = nil
    else
      @contact.each do |c|
        c.user = current_user
      end
    end
     @contact.update(contact_params)
    if @contact.save
      redirect_to contacts_show_path(@contact)
    else
      render :edit
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
