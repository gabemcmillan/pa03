class Advicepost < ActiveRecord::Base
  attr_accessible :category_id, :categoryname, :headline, :miniresume, :user_id, :price, :advisor_id, :website, :status,
      :twitter, :linkedin, :score, :rating_select, :tokenID, :refundTokenID, :messages_attributes, :rating_attributes, 
      :ratings_attributes, :advisor_attributes, :advisors_attributes
  
  
  belongs_to :advisor
    
  belongs_to :category
    
  belongs_to :advicepost_price
  
  has_many :messages
  
  accepts_nested_attributes_for :messages
    
  has_one :rating
  
  accepts_nested_attributes_for :rating
  accepts_nested_attributes_for :advisor
  
  
  #Sphinx - thinking_sphinx - indexing setup
  define_index do
    indexes miniresume
    indexes status
    indexes category.categoryname, :as => :category_name
  end
  
  
  before_update :set_rating
    
  def set_rating
      if self.rating.rating_select=="Up"
        rating.score += 5
      elsif self.rating.rating_select=="Down"
        #for now, do nothing.
        #rating.score -= 5
      end
  end

  
  #validates :advisor_id, presence: true
  
  #order by most recent
  default_scope order: 'adviceposts.created_at DESC'
  
  
  
  
end
