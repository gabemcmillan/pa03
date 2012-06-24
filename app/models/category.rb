class Category < ActiveRecord::Base
  attr_accessible :categorydesc, :categoryname
  

  has_many :adviceposts
   
   
end
