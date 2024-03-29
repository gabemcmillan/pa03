class User < ActiveRecord::Base
  FIELDS = [:credit_cards, :custom_fields]
    
  after_create :send_welcome_email 

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, and :activatable
  devise :database_authenticatable,:registerable,:recoverable,
  :rememberable,:trackable,:validatable 
      
  #Set attr_accesor to do get and set variables not in the model
  attr_accessor *FIELDS
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :name, :first_name, 
    :last_name, :username, :zip, :braintree_customer_id, :agree_emails       


  #for devise
  #validates_presence_of :email, :password
  attr_accessible :agree_emails
  
  validates_acceptance_of :agree_emails, :accept => true, :message => "Agree to email notifications must be accepted"
  
  
  has_many :messages

  def has_payment_info?
    !!braintree_customer_id
  end

  def with_braintree_data!
    return self unless has_payment_info?
    braintree_data = Braintree::Customer.find(braintree_customer_id)

    FIELDS.each do |field|
      send(:"#{field}=", braintree_data.send(field))
    end
    self
  end

  def default_credit_card
    return unless has_payment_info?
    credit_cards.find { |cc| cc.default? }
  end

  def send_welcome_email
     UserMailer.delay(queue: "email_registration").signup_confirmation_advisee(self)
  end
  

  
end
