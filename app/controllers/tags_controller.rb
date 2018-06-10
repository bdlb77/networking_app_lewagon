class TagsController < ApplicationController
  before_action :set_milestone, only: [:create, :new, :show, :update]
  before_action :set_user
  def index
    @tags = Tag.all

  end

  def new
    @tag = Tag.new
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.user = current_user
    @tag.milestone = @milestone
    @tag.save
    redirect_to milestone_tags_path
  end

  def edit
  end

  def update
   @tag = Tag.find(params[:id])
  if @tag.save
    @tag.update(tag_params)
    redirect_to milestone_tags_path
  else
    render :edit
  end
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:milestone_id])
  end
  def tag_params
    params.require(:tag).permit(:title)
  end
  def set_user
    @user = current_user
  end
end
