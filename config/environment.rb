# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Pa02::Application.initialize!


Date::DATE_FORMATS[:default] = "%Y-%m-%d %H:%M"





ActionMailer::Base.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => 'gabemcmillan',
  :password             => '53Gorest',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }



