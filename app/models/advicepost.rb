class Advicepost < ActiveRecord::Base
  attr_accessible :category_id, :categoryname, :miniresume, :user_id, :price, :advisor_id, :website, 
      :twitter, :linkedin, :score, :messages_attributes
  
  
  belongs_to :advisor
    
  belongs_to :category
    
  belongs_to :advicepost_price
  
  has_many :messages
  
  accepts_nested_attributes_for :messages
  
    
  
  #thinking_sphinx indexing setup
  define_index do
    indexes miniresume
    indexes category.categoryname, :as => :category_name
  end
  
  
  
  #validates :advisor_id, presence: true


  
  default_scope order: 'adviceposts.created_at DESC'
  
  
  
end
