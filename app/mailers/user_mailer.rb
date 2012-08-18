class UserMailer < ActionMailer::Base
  default from: "no-reply@pathadvisor.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  # 

#Advisee Emails

  #send when user signs up
  def signup_confirmation_advisee(user)
    @user = user
    mail to: @user.email, subject: "PathAdvisor Advisee new registration"
  end
    
  
  
  #send to advisee when he has sent a new message to an advisor
  def new_message_sent_advisee(user)
    @user = user
    mail to: @user.email, subject: "New message sent to your Advisor"
  end
  
  #send to advisee when advisor responds to message
  def response_sent_advisee(user, message)
    @user = user
    @message = message
    mail to: @user.email, subject: "New response message from your Advisor"
  end


#Advisor Emails

  #send when advisor registers
  def signup_confirmation_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "PathAdvisor Advisor account new registration"
  end

  #send to advisor when he has sent a new message to an advisor
  def new_message_sent_advisor(advisor, message)
    @advisor = advisor
    @message = message
    mail to: @advisor.email, subject: "You have a new message from an Advisee"
  end
  
  #send to advisor when he has responded to a message from an advisee
  def response_sent_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "You have responded to your advisee's message"
  end
  
  #send to advisor when he has not responded to advisee message after period of time
  def message_reminder_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "You haven't responded to your Advisee yet"
  end

  #send to advisor when he has not responded to advisee message after period of time
  def new_advicepost_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "New advice listing submitted"
  end
  
  #send to advisor when he has not responded to advisee message after period of time
  def new_advicepost_accepted_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "New advice listing accepted"
  end
  
  

  
  
end
