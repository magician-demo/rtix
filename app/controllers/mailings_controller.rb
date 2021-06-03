class MailingsController < ApplicationController
    def write_email
        @mailing = Mailing.new

        @event = Seat.find(params[:id]).ticket.event
        @seat= Seat.find(params[:id])
    end

    def send_email
        @user = current_user
        TicketMailer.with(user: @user, title: params[:mailing][:title], recipient: params[:mailing][:recipient], content: params[:mailing][:content], qrcode: params[:mailing][:qrcode] ).ticket_created.deliver_later

        redirect_to dashboard_path(params[:dashboard_id]), notice: "Hi, #{@user.name}, 已經成功將票券寄往以下email囉!: #{params[:mailing][:recipient]}"
    end

    private 
    def mailing_params
      params.require(:mailing).permit(:title, :recipient, :content, :qrcode)
    end

end
