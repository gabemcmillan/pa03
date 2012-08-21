class Advisor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  :first_name, :last_name, :address, :address2, :city, :state, :zip, :birthday, :gender, :username, 
  :phone, :cellphone, :paypal_email

  
  
  has_many :adviceposts, dependent: :destroy
  
  has_many :messages
  
    
  after_create :send_welcome_email_advisor 
  
  
  
  
  private

      def send_welcome_email_advisor
        UserMailer.delay(queue: "email_registration").signup_confirmation_advisor(self)
      end
      
      
  
  
end
