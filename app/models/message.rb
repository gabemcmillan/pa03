class Message < ActiveRecord::Base
  attr_accessible :advicepost_id, :advisor_id, :messageq, :messager, :thread, :user_id, :status
  
  belongs_to :user
  belongs_to :advicepost
  
  belongs_to :advisor
  
  
  
  
end
