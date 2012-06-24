class AddPricelabelToAdvicepostPrices < ActiveRecord::Migration
  def change
    add_column :advicepost_prices, :pricelabel, :string
  end
end
