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

    # TODO: start here -> The below code is how you add an attachment, like QRCode PDF to the email
    attachments['rtix_logo.png'] = File.read('app/assets/images/rtix_logo.png')
    # TODO: end here
    
    mail(
       from: "rickchiuuniverse@gmail.com",
       to: email_address_with_name(User.first.email, User.first.name),   
       subject: "[RTIX]報名人留言給您囉, 再請記得盡快抽空回覆!",
       cc: "friedrichchiu@gmail.com",
       bcc: "friedrichchiu@gmail.com"
    )
  end
end
