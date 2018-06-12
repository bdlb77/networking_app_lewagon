class MilestonesController < ApplicationController
    before_action :find_milestone, only: [:show, :update, :destroy, :edit]
    # before_action :find_contact, only: [:create]
  def index
    @milestones = Milestone.all
  end

  def new
    @milestone = Milestone.new
    # @locations = Location.all
    # @location = Location.new
    # @milestone.location_id = @location.id

    # @subject = Subject.new
    # subject.milestone_id = milestone.id

    # @tags = Tag.all
    # @tags.each do |t|
    #   if t == @subject
    #     @subject.tag_id = t.id
    #   else
    #     @tag = Tag.new
    #     @tag.title = @subject.name
    #     @subject.tag_id = @tag.id
    #   end
  end


  def create
    @milestone = Milestone.new(milestone_params)
    @milestone.contact = Contact.last
    # @milestone.location =  Location.find(params[:milestone][:location_id])
    # @milestone.user = current_user
    if @milestone.save!
      flash[:alert] = " Your Milestone has been set!"
      redirect_to milestones_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @milestone.update(milestone_params)
      flash[:alert] = " Your Milestone has been updated!"
      redirect_to user_milestones_path
    else
      render :edit
    end
  end

  def destroy
    @milestone.destroy
    flash[:alert] = "Your Milestone has been deleted!"
  end

  def show
  end

  private

  # def set_contact
  #   @contact = Contact.find(params[:contact_id])
  # end

  def find_milestone
    @milestone = Milestone.find(params[:id])
  end

   def find_contact
    @contact = Contact.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:notes, :contact_type, :contact_id)
    # subjects_attributes: [:id, :_destroy, :tag_id, tag_attributes: [:id, :_destroy, :title]]
    # location_attributes: [:id, :_destroy, :title]
    # contact_attributes: [:id, :first_name, :last_name, :position, :company, :username, :email, :phone_number]
    # )
  end
end
