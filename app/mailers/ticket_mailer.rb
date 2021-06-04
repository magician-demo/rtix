class TicketMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.ticket_created.subject
  #
  def ticket_created
    @user = params[:user]
    @title = params[:title]
    @recipient = params[:recipient]
    @content = params[:content]
    @checkin_id = params[:checkin_id]


    attachments['rtix_logo.png'] = File.read('app/assets/images/rtix_logo.png')

    mail(
      to: @recipient,
      subject: @title
    )
  end
end
