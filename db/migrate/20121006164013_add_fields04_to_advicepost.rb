class AddFields04ToAdvicepost < ActiveRecord::Migration
  def change
    add_column :adviceposts, :headline, :string
    
  end
end
