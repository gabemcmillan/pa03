class User < ActiveRecord::Base
  after_create :send_welcome_email 


  

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, and :activatable
  devise :database_authenticatable,:registerable,:recoverable,
  :rememberable,:trackable,:validatable 
  
    
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :name, :firstname, :lastname, :username, :zip       

  #for devise
  #validates_presence_of :email, :password
  

  after_create :send_welcome_email 

  
  
  has_many :messages
  
  
  
  private

      def send_welcome_email
        UserMailer.signup_confirmation(self).deliver
      end
  


  
  
end
