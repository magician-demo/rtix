class ContactMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_created.subject
  #
  def contact_created
    @user = params[:user]
    @contact = params[:contact]
    @event = params[:event]

    attachments['rtix_logo.png'] = File.read('app/assets/images/rtix_logo.png')

    mail(
      to: @event.organization.e_mail,
      subject: '[RTIX]參加人留言給您囉, 再請記得盡快抽空回覆!',
    )
  end
end
