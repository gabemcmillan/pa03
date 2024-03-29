class Advisor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  :first_name, :last_name, :address, :address2, :city, :state, :zip, :birthday, :gender, :username, 
  :phone, :cellphone, :paypal_email, :agree_paypal, :agree_emails
  
  has_many :adviceposts, dependent: :destroy
  
  has_many :messages
  
  #has_one :ratings
    
  after_create :send_welcome_email_advisor 
  
  
  attr_accessible :agree_paypal, :agree_emails
  
  validates_acceptance_of :agree_emails, :accept => true, :message => "Agree to email notifications must be accepted"
  
  #validates_acceptance_of :agree_paypal, :agree_email, :accept => true, :message => "Agree to PayPal payments must be accepted"

  
  
  
  private

      def send_welcome_email_advisor
        UserMailer.delay(queue: "email_registration").signup_confirmation_advisor(self)
      end
      
      
  
  
end
