
class User < ActiveRecord::Base
  
  after_create :send_welcome_email 


  
    
    
end




