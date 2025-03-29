class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show destroy]

  # GET /contacts
  def index
    contacts = Contact.all
    render json: contacts
  end

  # GET /contacts/:id
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: contact, status: :created, location: contact
    else
      render json: contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/:id
  def destroy
    @contact.destroy!
    head :no_content
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Contact not found" }, status: :not_found
  end

  def contact_params
    params.require(:contact).permit(:name, :phone)
  end
end
