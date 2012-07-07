class Advicepost < ActiveRecord::Base
  attr_accessible :category_id, :categoryname, :miniresume, :user_id, :price
  
  belongs_to :user
  belongs_to :category  
  belongs_to :advicepost_price
  has_many :messages

  
  
  
  #thinking_sphinx indexing
  define_index do
    indexes miniresume
    indexes category.categoryname, :as => :category_name
  end
  


  
  
  validates :user_id, presence: true

  
  default_scope order: 'adviceposts.created_at DESC'
  

  
  
end
