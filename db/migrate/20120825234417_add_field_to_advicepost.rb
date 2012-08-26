class AddFieldToAdvicepost < ActiveRecord::Migration
  
  def change
    add_column :adviceposts, :score, :integer
  end
end
