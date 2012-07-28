class User < ActiveRecord::Base
  

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, and :activatable
  devise :database_authenticatable,:registerable,:recoverable,
  :rememberable,:trackable,:validatable 
  
    
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :name, :firstname, :lastname, :username, :zip       

  #for devise
  #validates_presence_of :email, :password
  

  has_many :adviceposts, dependent: :destroy
  
  has_many :messages
  
  
  
    


  
  
end
