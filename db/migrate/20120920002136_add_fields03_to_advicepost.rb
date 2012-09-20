class AddFields03ToAdvicepost < ActiveRecord::Migration
  def change
    
    add_column :adviceposts, :astatus, :string
    add_column :adviceposts, :tokenID, :string
    add_column :adviceposts, :refundTokenID, :string
    
    
  end
end
