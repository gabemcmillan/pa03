class Message < ActiveRecord::Base
  attr_accessible :advicepost_id, :advisor_id, :messageq, :messager, :thread, :user_id, :status
  
  belongs_to :user
  
  belongs_to :advisor
  
    
  belongs_to :advicepost
  

  
  
  #self.per_page = 10
  
  
  
end
