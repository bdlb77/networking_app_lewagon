class AssigmentsController < ApplicationController
before_action :set_milestone
before_action :set_contact

  def new
    @assigment = Assigment.new
  end

  def create
    @assigment = Assigment.new(assigment_params)
    @assigment.save!
  end

  def edit
   @assigment = Assigment.find(params[:id])
   @assigment.completed = true
   @assigment.save
  end

  def index
    @assigments = Assigment.all
  end

  def update
   @assigment = Assigment.find(params[:id])
   raise
   @assigment.completed = true
   @assigment.save
   redirect_to redirect_to contact_milestones_path(@contact)
  end

  def destroy
    @assigment.destroy
  end

  def complete
   @assigment = Assigment.find(params[:id])
   @assigment.completed = true
   @assigment.save
   redirect_to redirect_to contact_milestones_path(@contact)
 end

 def incomplete
  @assigment = Assigment.find(params[:id])
  @assigment.completed = false
  @assigment.save
  redirect_to redirect_to contact_milestones_path(@contact)
end



private

def assigment_params
    params.require(:assigment).permit(:title, :milestone_id, :completed)
end

def set_milestone
    @milestone = Milestone.find(params[:milestone_id])
  end

def set_contact
    @contact = Contact.find(params[:contact_id])
  end

end
