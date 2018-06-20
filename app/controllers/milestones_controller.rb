class MilestonesController < ApplicationController
before_action :find_milestone, only: [:show, :update, :destroy, :edit]
before_action :find_contact

  def index
    @milestones = Milestone.where(contact_id: find_contact.id ).order("created_at DESC")
    @contact = find_contact
    @locations = Location.all
    @assigments = Assigment.all
  end

  def new
    @milestone = Milestone.new
    @user = current_user
    @location = Location.new
    @subject = Subject.new
    @tag = Tag.new
  end


  def create
    @milestone = Milestone.new(milestone_params)
    @milestone.contact = @contact

      flash[:alert] = "Your milestone has been set!"
      @locations = Location.all
      @have_location = false
      if not @milestone.last_location.blank?
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
      end
    if @milestone.save!
      @tags = Tag.all

    if not @milestone.last_tag.blank?
      @have_first_tag = false
      if @milestone.last_tag != "Choose_tag"
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
    end

    # binding.pry
    if not @milestone.last_tag_two.blank?
      @have_second_tag = false
      if @milestone.last_tag_two != "Choose_tag"
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
    end

    if not @milestone.assigment_one.empty?
        @assigment1 = Assigment.new(milestone_id:@milestone.id, title:@milestone.assigment_one)
        @assigment1.save!
      end

    if not @milestone.assigment_two.empty?
      @assigment2 = Assigment.new(milestone_id:@milestone.id, title:@milestone.assigment_two)
      @assigment2.save!
    end

    redirect_to contact_milestones_path(@contact)
    else
      render :edit
    end
  end


  def edit
    @user = current_user
  end

    def update
      @milestone.update(milestone_params)
        flash[:alert] = "Your milestone has been set!"
        @locations = Location.all
        if not @milestone.last_location.blank?
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
            end
        end
      @milestones = Milestone.all
      if @milestone.save!
        @subject1 = @milestone.subjects[0]
        @subject2 = @milestone.subjects[1]
        @subjects = Subject.all
        @tags = Tag.all

      if not @milestone.last_tag.blank?
        @first_tag_exist = false
        @has_first_tag = false
        if @milestone.last_tag != "Choose_tag"
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
            if not @milestone.subjects[0].empty?
              @milestone.subjects[0].destroy
            end
          end
        end
      end

      if not @milestone.last_tag_two.blank?
        @seconed_tag_exist = false
        @has_second_tag = false
        if @milestone.last_tag_two != "Choose_tag"
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
            if !@milestone.subjects.nil?
              @milestone.subjects[1].destroy
            end
          end
          if @seconed_tag_exist == false
            @tag2 = Tag.new(title:@milestone.last_tag_two, user_id:@contact.user_id)
            @tag2.save!
            @new_subject2 = Subject.new(milestone_id:@milestone.id, tag_id:@tag2.id)
            @new_subject2.save!
            if not @milestone.subjects[1].empty?
              @milestone.subjects[1].destroy
            end
          end
        end
      end

      if not @milestone.assigment_one.empty?
        @assigment1 = Assigment.new(milestone_id:@milestone.id, title:@milestone.assigment_one)
        @assigment1.save!
      end

      if not @milestone.assigment_two.empty?
        @assigment2 = Assigment.new(milestone_id:@milestone.id, title:@milestone.assigment_two)
        @assigment2.save!
      end

        flash[:alert] = " Your Milestone has been updated!"
        redirect_to contact_milestones_path(@contact, @milestone)
      else
        render :edit
      end
    end

  def destroy
    @milestone.destroy
    redirect_to contact_milestones_path(@contact)
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

  def milestone_params
    params.require(:milestone).permit(:note, :last_location, :last_tag_two, :last_tag, :contact_type, :assigment_one, :assigment_two, :location_id)
    # subjects_attributes: [:id, :_destroy, :tag_id, tag_attributes: [:id, :_destroy, :title]]
    # location_attributes: [:id, :_destroy, :title]
    # contact_attributes: [:id, :first_name, :last_name, :position, :company, :username, :email, :phone_number]
    # )
  end

  def assigment_params
    params.require(:assigment).permit(:title, :milestone_id, :completed)
  end

end
