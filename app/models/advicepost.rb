class Advicepost < ActiveRecord::Base
  attr_accessible :category_id, :categoryname, :miniresume, :user_id, :price
  
  belongs_to :user
  belongs_to :category  
  belongs_to :advicepost_price
  
  
  
  #thinking_sphinx indexing
  define_index do
    indexes miniresume
    indexes category.categoryname, :as => :category_name
  end
  


  
  
  validates :user_id, presence: true
  validates :miniresume, :length => { :maximum => 160 }
  
  default_scope order: 'adviceposts.created_at DESC'
  

  
  
end
