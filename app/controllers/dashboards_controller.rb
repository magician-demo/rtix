class DashboardsController < ApplicationController
    def index
        @user = User.find(2)
        @user_events = @user.events

        @hosts = @user.organizations

        @best_events = Event.all.sample(12)
    end

    def new
        @user = User.find(2)
        @contact = Contact.new
        @event = Event.find_by(id: params[:id])
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
      params.require(:contact).permit(:name, :email, :tel, :event, :title, :feedback, :user_id)
    end

end
