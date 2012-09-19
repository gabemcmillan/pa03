class AddFields02ToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :status, :string
    add_column :advisors, :tokenID, :string
    add_column :advisors, :refundTokenID, :string
    
  end
end
