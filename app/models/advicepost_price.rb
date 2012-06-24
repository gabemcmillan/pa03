class AdvicepostPrice < ActiveRecord::Base
  attr_accessible :price, :pricelabel
  
  has_many :adviceposts
  
  
  
end
