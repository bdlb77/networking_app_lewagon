class MilestonesController < ApplicationController
before_action :find_milestone, only: [:show, :update, :destroy, :edit]
before_action :find_contact

  def index
    @milestones = Milestone.where(contact_id: find_contact.id )
    @contact = find_contact
  end

  def new
    @milestone = Milestone.new
    @user = current_user
    @location = Location.new
    @subject = Subject.new
    @tag = Tag.new
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
    @milestone.contact = @contact
    if @milestone.save!
      flash[:alert] = "Your milestone has been set!"
      @locations = Location.all
      @have_location = false
      @locations.each do |l|
        if l.title == @milestone.last_location
          @milestone.location_id = l.id
          @have_location = true
          @milestone.save!
        end
      end
      if @have_location == false
        @location = Location.new(title:@milestone.last_location, user_id:@contact.user_id)
          if @location.save!
            @milestone.location_id = @location.id
            @milestone.save!
          end
      end
      @tags = Tag.all
      @have_first_tag = false
      @tags.each do |t|
        if t.title == @milestone.last_tag
          @subject = Subject.new(milestone_id:@milestone.id, tag_id:t.id)
          @have_first_tag = true
          @subject.save!
        end
      end
      if @have_first_tag == false
        @tag = Tag.new(title:@milestone.last_tag, user_id:@contact.user_id)
        @tag.save!
        @subject = Subject.new(milestone_id:@milestone.id, tag_id:@tag.id)
        @subject.save!
      end

      @have_second_tag == false
      @tags.each do |t|
        if t.title == @milestone.last_tag_two
          @subject = Subject.new(milestone_id:@milestone.id, tag_id:t.id)
          @have_second_tag = true
          @subject.save!
        end
      end
      if @have_second_tag = false
        @tag = Tag.new(title:@milestone.last_tag_two, user_id:@contact.user_id)
        @tag.save!
        @subject = Subject.new(milestone_id:@milestone.id, tag_id:@tag.id)
        @subject.save!
      end
      redirect_to contact_milestone_path(@contact, @milestone)
    else
      render :edit
    end
  end


  def edit
  end

  def update
    if @milestone.update(milestone_params)
      render "locations/update"
      render "tags/update"
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

  def find_contact
    @contact = Contact.find(params[:contact_id])
  end

  def find_milestone
    @milestone = Milestone.find(params[:id])
  end

  #  def find_contact
  #   @contact = Contact.find(params[:id])
  # end


  def milestone_params
    params.require(:milestone).permit(:note, :last_location, :last_tag_two, :last_tag, :contact_type, :contact_id)
    # subjects_attributes: [:id, :_destroy, :tag_id, tag_attributes: [:id, :_destroy, :title]]
    # location_attributes: [:id, :_destroy, :title]
    # contact_attributes: [:id, :first_name, :last_name, :position, :company, :username, :email, :phone_number]
    # )
  end

end
