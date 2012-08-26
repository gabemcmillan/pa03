class AddFieldToAdvisors < ActiveRecord::Migration

  def change
    add_column :advisors, :score, :integer
  end
  
end
