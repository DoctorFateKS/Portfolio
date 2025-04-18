class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Thank you for your message. We will get back to you soon."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error sending your message. Please try again."
      render :new
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :message)
  end
end
