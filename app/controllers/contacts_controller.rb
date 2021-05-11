class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(contact_params)
      if @contact.save 
        redirect_to dashboards_path, notice: "感謝您的意見反饋!活動舉辦方將會盡快回應您!"
      else
        render :new 
      end
    end


    private 
    def contact_params
      params.require(:contact).permit(:name, :email, :tel, :event, :title, :feedback)
    end
end
