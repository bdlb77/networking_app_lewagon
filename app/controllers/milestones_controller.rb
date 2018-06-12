class MilestonesController < ApplicationController
    before_action :set_milestone, only: [:show, :update, :destroy, :edit]
    before_action :set_contact, only: [:create]
  def index
    @milestones = Milestone.all
  end

  def new
    @milestone = Milestone.new
    @locations = Location.all
    @location = Location.new
    @milestone.location_id = @location.id

    @subject = Subject.new
    subject.milestone_id = milestone.id

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


  def create
    @milestone = Milestone.new(milestone_params)
    @milestone.user = current_user
    @milestone.contact = @contact
    if @milestone.save
      flash[:alert] = " Your Milestone has been set!"
      redirect_to user_milestones_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    @milestone
    if @milestone.save
      @milestone.update(milestone_params)
      flash[:alert] = " Your Milestone has been updated!"
      redirect_to user_milestones_path
    else
      render :edit
    end
  end

  def destroy
    @milestone.destroy
    flash[:alert] = "Your Milestone for #{@milestone.contact.first_name}
      has been deleted!"
  end

  def show
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def set_milestone
    @milestone = Milestone.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:notes, :contact_type)
  end
end
end
