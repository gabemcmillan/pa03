class AddPriceToAdviceposts < ActiveRecord::Migration
  def change
    add_column :adviceposts, :price, :integer
  end
end
