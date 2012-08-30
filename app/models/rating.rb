class Rating < ActiveRecord::Base
  
  attr_accessible :advisor_id, :score, :advicepost_id, :rating_select
  
  belongs_to :advisor
  
  belongs_to :advicepost
  


  
  
  
end

