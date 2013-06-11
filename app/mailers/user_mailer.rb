class UserMailer < ActionMailer::Base
  default from: 'PathAdvisor <noreply@pathadvisor.org>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  # 


  #send when user signs up
  def signup_confirmation_advisee(user)
    @user = user
    mail to: @user.email, subject: "Advisee new registration"
  end
  
  #send when advisor registers
  def signup_confirmation_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "Advisor account new registration"
  end
  
  #send to advisee when he has sent a new message to an advisor
  def new_message_sent_advisee(user)
    @user = user
    mail to: @user.email, subject: "New message sent to Advisor"
  end
  
  #send to advisor when he has sent a new message to an advisor
  def new_message_sent_advisor(advisor, message)
    @advisor = advisor
    @message = message
    mail to: @advisor.email, subject: "New message from Advisee"
  end
  
  #send to advisee when advisor responds to message
  def response_sent_advisee(user, message)
    @user = user
    @message = message
    mail to: @user.email, subject: "New response message from Advisor"
  end

  #send to advisor when he has responded to a message from an advisee
  def response_sent_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "You have responded to Advisee's message"
  end


  #send to advisor when he has submitted a new Advice Listing
  def new_advicepost_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "New advice listing submitted"
  end
  
  #send to PathAdvisor Admin to review the Submitted AdvicePost
  def new_advicepost_admin(advicepost,advisor)
    @advicepost = advicepost
    @advisor = advisor
    @admin_email = "gabe@pathadvisor.com"
    mail to: @admin_email, subject: "Check new advice listing submitted"
  end
  
  #send to advisor when he has not responded to advisee message after period of time
  def new_advicepost_accepted_advisor(advisor)
    @advisor = advisor
    mail to: @advisor.email, subject: "New advice listing accepted"
  end
  
  #send to advisor when he has sent a new message to an advisor
  def reminder_message_advisor(advisor, message)
    @advisor = advisor
    @message = message
    mail to: @advisor.email, subject: "Reminder to respond to new message from Advisee"
  end
  
  def canceled_message_advisor(advisor, message)
    @advisor = advisor
    @message = message
    mail to: @advisor.email, subject: "Advice message canceled"
  end  
  
  def canceled_message_advisee(user, message)
    @user = user
    @message = message
    mail to: @user.email, subject: "Advice message canceled"
  end



  
end
