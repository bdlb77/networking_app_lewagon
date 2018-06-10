class ContactsController < ApplicationController
  before_action :find_contact, only: [:show, :create, :edit,  :update, :destroy]

  def index
    @contacts = Contact.all
    # @contacts = policy_scope(Contact).order(:desc)
  end

  def new
    @contact = Contact.new
    @user = current_user
  end

  def show
  end

  def create
     @contact.update(contact_params)
    if @contact.save
      redirect_to contacts_show_path(@contact)
    else
      render :edit
    end
  end

  def edit
  end

  def update
    @contact.update(contact_params)
    if @contact.save
      redirect_to contact_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end
end

private

    def find_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :company, :username, :email, :phone_number, :date_of_birth)
  end
