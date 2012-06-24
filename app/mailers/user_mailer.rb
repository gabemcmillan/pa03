class UserMailer < ActionMailer::Base
  default from: "notifications@pathadvisor.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail to: @user.email, subject: "Thanks for joining PathAdvisor!"
  end
end
