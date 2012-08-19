class ChangeTypeOfAdvisors < ActiveRecord::Migration
  
  
  def change
    change_column :advisors, :headline, :string
    change_column :advisors, :paypal_email, :string
    change_column :advisors, :payment_option, :string

  end
  
  
end
