class AddTransactionIdToMessages < ActiveRecord::Migration


  def change
    add_column :messages, :transaction_id, :string

        
  end
  
  
end
