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


    attachments['rtix_logo.png'] = File.read('app/assets/images/rtix_logo.png')

    mail(
       from: "friedrichchiu@gmail.com",
       to: "rickchiuuniverse@gmail.com",
       subject: @title
    )
  end
end
