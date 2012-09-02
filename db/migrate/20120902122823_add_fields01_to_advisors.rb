class AddFields01ToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :agree_paypal, :boolean, :default => false
    add_column :advisors, :agree_emails, :boolean, :default => false
    
  end
end
