class Rating < ActiveRecord::Base
  
  belongs_to :advisor
  
  
  
  
  attr_accessible :advisor_id, :score
  
  
  
end

