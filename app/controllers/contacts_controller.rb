class ContactsController < ApplicationController
  before_action :find_contact, only: [:show, :edit, :update, :destroy]
  before_action :user_user, only: [:create]

  def index
     # @contacts = policy_scope(Contact).order(:desc)
    # @user = current_user
    # if @user.blank?
    #   @contacts = nil
    # else
    @contacts = Contact.all
    #   @contacts.each do |c|
    #     c.user = current_user
    #   end
    # end
  end


  def new
    # @user = current_user
    @contact = Contact.new
    # @contact.user = current_user

    # @milestone = Milestone.new
    # @milestone.contact_id = @contact.id

    # @locations = Location.all
    # @location = Location.new
    # @location.user_id = current_user
    # @milestone.location_id = @location.id

    # @subject = Subject.new
    # @subject.milestone_id = @milestone.id

    # @tags = Tag.all
    # @tags.each do |t|
    #   if t == @subject
    #     @subject.tag_id = t.id
    #   else
    #     @tag = Tag.new
    #     @tag.title = @subject.name
    #     @subject.tag_id = @tag.id
    #   end
    # end
  end


  def show
    # @milestones = Milestone.where(contact_id: params[:contact_id])
    # @subject = []
    # @milestones.each do |m|
    #   current_tags = subject.where(milestone_id: params[:milestone_id])
    #   @subject << current_tags
    # end
    # @locations = []
    # @milestones.each do |m|
    #   current_locations = m.location_id
    #   @locations << current_locations
    # end
    # @contact.user = current_user
  end

  def create
    # @contact.user_id = current_user
    @contact = Contact.new(contact_params)
    @contact.user = @user
    if @contact.save
      flash[:alert] = " Your contact has been set!"
      redirect_to user_contact_path( @user, @contact)
    else
      render :edit
    end
  end
    # @milestone = Milestone.new(milestone_params)
    # if @milestone.save
    #   redirect_to contact_path(@contact)
    # else
    #   render :edit
    # end

    # @subject = Subject.new(subject_params)
    # if @subject.save
    #   redirect_to contact_path(@contact)
    # else
    #   render :edit
    # end

    # @locations = Location.all
    # @locations.each do |l|
    #   if l == @location
    #      @milestone.location_id = l.id
    #   else
    #     @location = Location.new(location_params)
    #     if @location.save
    #       redirect_to contact_path(@contact)
    #     else
    #       render :new
    #     end
    #   end
    # end

  def edit
  end

  def update
    if @contact.update(contact_params)
      flash[:alert] = " Your contact has been updated!"
      redirect_to contact_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to user_contacts_path
  end

private

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def find_user
    @user = User.find(params[:id])
  end

  # def contact_params
  #   params.require(:contact).permit(:first_name, :last_name, :position, :company, :username, :email, :phone_number, :date_of_birth)
  # end

  # def milestone_params
  #   params.require(:milestone).permit(:notes, :contact_type)
  # end

  # def subject_params
  #   params.require(:subject).permit(:name)
  # end

  # def location_params
  #   params.require(:location_params).permit(:title)
  # end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :company, :username, :email, :phone_number, :user_id)
    # milstone_attributes: [:id, :notes, :_destroy, subjects_attributes: [:id, :_destroy, :tag_id, tag_attributes: [:id, :_destroy, :title]], location_attributes: [:id, :_destroy, :title]]
    # user_attributes: [:id, :email]
    # )
  end

end
