# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!



ActionMailer::Base.smtp_settings = {
  user_name: 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
  password: ENV['sendgrid_key'], # This is the secret sendgrid API key which was issued during API key creation
  domain: 'rtix.site',   #測試時使用: 127.0.0.1:3000 ;  正式：rtix.site
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: 'plain',
  enable_starttls_auto: true
}

