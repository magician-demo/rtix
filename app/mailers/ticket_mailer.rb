class TicketMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.ticket_created.subject
  #
  def ticket_created
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
