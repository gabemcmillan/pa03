class UserMailer < ActionMailer::Base
  default from: "no-reply@pathadvisor.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  # 

#Advisee Emails
  #send when user registers
  def signup_confirmation(user)
    @user = user
    mail to: @user.email, subject: "PathAdvisor user registration"
  end
    
  #send to advisee when he has sent a new message to an advisor
  def new_message_sent_advisee(user)
    @user = user
    mail to: @user.email, subject: "New message sent to your Advisor"
  end
  
  #send to advisor when advisee sends message to advisor
  def advisee_message(user)
    @user = user
    mail to: @user.email, subject: "You have a new message from PathAdvisor"
  end


#Advisor Emails

  #send when advisor registers
  def signup_confirmation_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "PathAdvisor Advisor account new registration"
  end

  #send to advisor when he has sent a new message to an advisor
  def new_message_sent_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "You have received a new message from an Advisee"
  end
  
  #send to advisor when he has responded to a new message to an advisor
  def response_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "New message from your advisor"
  end
  
  #send to advisor when he has not responded to advisee message after period of time
  def message_reminder_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "You haven't responded to your Advisee yet"
  end


  
  
end
