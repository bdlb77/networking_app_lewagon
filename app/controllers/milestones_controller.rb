class MilestonesController < ApplicationController
before_action :find_milestone, only: [:show, :update, :destroy, :edit]
before_action :find_contact

  def index
    @milestones = Milestone.where(contact_id: find_contact.id )
    @contact = find_contact
    @locations = Location.all
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

      flash[:alert] = "Your milestone has been set!"
      @locations = Location.all
      @have_location = false
      @locations.each do |l|
        if l.title == @milestone.last_location
          @milestone.location= l
          @have_location = true
          @milestone.save!
        end
      end
      if @have_location == false
        @location = Location.new(title:@milestone.last_location, user_id:@contact.user_id)
        if @location.save!
          @milestone.location = @location
          @milestone.save!
        end
      end
    if @milestone.save!
      @tags = Tag.all

    if not @milestone.last_tag.empty?
      @have_first_tag = false
      @tags.each do |t|
        if t.title == @milestone.last_tag
          @subject1 = Subject.new(milestone_id:@milestone.id, tag_id:t.id)
          @have_first_tag = true
          @subject1.save!
        end
      end
      if @have_first_tag == false
        @tag1 = Tag.new(title:@milestone.last_tag, user_id:@contact.user_id)
        @tag1.save!
        @subject1 = Subject.new(milestone_id:@milestone.id, tag_id:@tag1.id)
        @subject1.save!
      end
    end

    # binding.pry
    if not @milestone.last_tag_two.empty?
      @have_second_tag = false
      @tags.each do |t|
        if t.title == @milestone.last_tag_two
          @subject2 = Subject.new(milestone_id:@milestone.id, tag_id:t.id)
          @have_second_tag = true
          @subject2.save!
        end
      end
      if @have_second_tag == false
        @tag2 = Tag.new(title:@milestone.last_tag_two, user_id:@contact.user_id)
        @tag2.save!
        @subject2 = Subject.new(milestone_id:@milestone.id, tag_id:@tag2.id)
        @subject2.save!
      end
    end
      redirect_to contact_milestones_path(@contact)
    else
      render :edit
    end
  end


  def edit
  end

    def update
      @milestone.update(milestone_params)
        flash[:alert] = "Your milestone has been set!"
        @locations = Location.all
        # @past_location = @milestone.location
        if @milestone.last_location != @milestone.location.title
          @have_location = false
          @locations.each do |l|
            if l.title == @milestone.last_location
              @milestone.location = l
              @have_location = true
              @milestone.save!
            end
          end
          if @have_location == false
            @location = Location.new(title:@milestone.last_location, user_id:@contact.user_id)
            if @location.save!
              @milestone.location = @location
              @milestone.save!
            end
          end
          # @location_empty = true
          @milestones = Milestone.all
          # @milestones.each do |m|
          #   if @past_location == m.location
          #     # @location_empty = false
          #   end
          # end
          # if @location_empty == true
          #    @location.destroy
          # end
        end
      if @milestone.save!
        @subject1 = @milestone.subjects[0]
        @subject2 = @milestone.subjects[1]
        @subjects = Subject.all
        @tags = Tag.all

      if not @milestone.last_tag.empty?
        @first_tag_exist = false
        @has_first_tag = false
        @tags.each do |t|
          if t.title == @milestone.last_tag
            @first_tag_exist = true
            @tag_id1 = t.id
            @milestone.tags.each do |mt|
              if mt.title == @milestone.last_tag
                 @has_first_tag = true
              end
            end
          end
        end
        if (@first_tag_exist == true && @has_first_tag == false)
          @new_subject1 = Subject.new(milestone_id:@milestone.id, tag_id:@tag_id1)
          @new_subject1.save!
          @milestone.subjects[0].destroy
        end
        if @first_tag_exist == false
          @tag1 = Tag.new(title:@milestone.last_tag, user_id:@contact.user_id)
          @tag1.save!
          @new_subject1 = Subject.new(milestone_id:@milestone.id, tag_id:@tag1.id)
          @new_subject1.save!
          @milestone.subjects[0].destroy
        end
      end

      if not @milestone.last_tag.empty?
        @seconed_tag_exist = false
        @has_second_tag = false
        @tags.each do |t|
          if t.title == @milestone.last_tag_two
            @seconed_tag_exist = true
            @tag_id2 = t.id
             @milestone.tags.each do |mt|
              if mt.title == @milestone.last_tag_two
                 @has_second_tag = true
              end
            end
          end
        end
        if (@seconed_tag_exist == true && @has_second_tag == false)
          @new_subject2 = Subject.new(milestone_id:@milestone.id, tag_id:@tag_id2)
          @new_subject2.save!
          @milestone.subjects[1].destroy
        end
        if @seconed_tag_exist == false
          @tag2 = Tag.new(title:@milestone.last_tag_two, user_id:@contact.user_id)
          @tag2.save!
          @subject2 = Subject.new(milestone_id:@milestone.id, tag_id:@tag2.id)
          @subject2.save!
          @milestone.subjects[1].destroy
        end
      end

        flash[:alert] = " Your Milestone has been updated!"
        redirect_to contact_milestone_path(@contact, @milestone)
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
   @milestone = Milestone.find(params[:contact_id])
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
