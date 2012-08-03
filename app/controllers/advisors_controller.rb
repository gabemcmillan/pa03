
class Advisor < ActiveRecord::Base
   
   after_create :send_welcome_email_advisor 



    
    
end




