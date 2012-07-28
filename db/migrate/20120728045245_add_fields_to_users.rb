class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :username, :string
    add_column :users, :zip, :string
    add_column :users, :howheard, :string
        
  end
  
  
  
  
end
