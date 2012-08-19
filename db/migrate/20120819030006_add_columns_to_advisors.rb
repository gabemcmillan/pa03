class AddColumnsToAdvisors < ActiveRecord::Migration

    def self.up
      add_column :advisors, :headline,  :text
      add_column :advisors, :payment_option, :text
      add_column :advisors, :paypal_email, :text
      
    end

    def self.down
      remove_column :advisors, :headline,  :text
      remove_column :advisors, :payment_option, :text
      remove_column :advisors, :paypal_email, :text
    end
  
  
end
