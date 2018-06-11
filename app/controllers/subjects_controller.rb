class SubjectsController < ApplicationController


def new
  @subject = Subject.new
end

def create
  @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to contacts_show_path(@subject)
    else
      render :edit
    end
end
end

private



  def subject_params
    params.require(:subject).permit(:name)
  end
