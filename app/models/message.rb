class Message < ActiveRecord::Base
  attr_accessible :advicepost_id, :advisor_id, :messageq, :messager, :thread, :user_id
  
  belongs_to :user
  belongs_to :advicepost
  
  
  
  
  
end