class Message < ActiveRecord::Base
  attr_accessible :advicepost_id, :advisor_id, :messageq, :messager, :thread, :user_id, :status, :transaction_id
  
  belongs_to :user
  
  belongs_to :advisor
  
  belongs_to :advicepost
  
  
  #self.per_page = 10
  
  
  def self.cancel
    #query for only messages marked "New"
    @messages = Message.find(:all, :conditions=>{:status=>"New"})
    #for loop to loop through collection
    for message in @messages do
      #get advisor object from message association
      @advisor = Advisor.find(:first, :conditions => { :id => message.advisor_id})
          #if message was created more than 72 hours ago, cancel message
          if (message.created_at < 25.minutes.ago )
            #edit message.status to "Cancelled", void Braintree payment by transaction_id, send cancelled 
            #email to advisor and advisee that its been over the 3 day (72 hour) time limit.    
            #void braintree payment by transaction_id
            result = Braintree::Transaction.void(message.transaction_id)
            if result.success?
              # transaction successfully voided
              message.status = "Canceled"
              message.save
              #send cancelled email to advisor
              UserMailer.delay(queue: "email_canceled_message").canceled_message_advisor(@advisor, @message)
              #send cancelled email to advisee that their payment has been voided
              #UserMailer.delay(queue: "email_canceled_message").canceled_message_advisee(@user, @message)
              
            else
              p result.errors
            end
          else
            #puts "False"
          end
    end
  end
  
  
  
  def self.reminder1
    #query for only messages marked "New"
    @messages = Message.find(:all, :conditions=>{:status=>"New"})
    #for loop to loop through collection
    for message in @messages do
      #get advisor object from message association
      @advisor = Advisor.find(:first, :conditions => { :id => message.advisor_id})
          #if message was created more than 48 hours ago, send reminder email
          if (message.created_at < 15.minutes.ago )
              #send reminder email to Advisor to respond to their message before its cancelled. They have 1 day left.
              UserMailer.delay(queue: "email_reminder_message").reminder_message_advisor(@advisor, @message)
          else
            puts "False"
          end
    end
  end
  
  
  
  
end
