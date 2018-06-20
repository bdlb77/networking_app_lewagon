class AssigmentsController < ApplicationController
before_action :set_milestone

  def new
    @assigment = Assigment.new
  end

  def create
    @assigment = Assigment.new(assigment_params)
    @assigment.save!
  end

  def edit
  end

  def index
    @assigments = Assigment.all
  end

  def update
  end

  def destroy
    @assigment.destroy
  end


private

def assigment_params
    params.require(:assigment).permit(:title, :milestone_id, :completed)
end

def set_milestone
    @milestone = Milestone.find(params[:milestone_id])
  end

end
