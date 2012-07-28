class Advisor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  :firstname, :lastname, :address, :address2, :city, :state, :zip, :birthday, :gender, :username, 
  :phone, :cellphone
  # attr_accessible :title, :body
  
  
  has_many :adviceposts, dependent: :destroy
  
  has_many :messages
  
  
  
  
end
