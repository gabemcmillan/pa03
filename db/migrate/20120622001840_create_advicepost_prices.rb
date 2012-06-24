class CreateAdvicepostPrices < ActiveRecord::Migration
  def change
    create_table :advicepost_prices do |t|
      t.integer :price

      t.timestamps
    end
  end
end
