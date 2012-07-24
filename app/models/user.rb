class User < ActiveRecord::Base
  

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, :confirmable and :activatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
         
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation       



  has_many :adviceposts, dependent: :destroy
  has_many :messages
  
  
  
    

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      if auth["provider"] == "facebook"
        user.email = auth['extra']['raw_info']['email'] if auth['extra']['raw_info']['email'] 
      else 
        user.email = auth["info"]["email"] 
      end
      #Send email for signup confirmation
      UserMailer.signup_confirmation(user).deliver
      
    end
  end  
    
  
  
end
