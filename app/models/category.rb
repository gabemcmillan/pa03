class Category < ActiveRecord::Base
  attr_accessible :categorydesc, :categoryname, :status
  

  has_many :adviceposts
   
   
end
