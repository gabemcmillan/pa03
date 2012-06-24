class CreateGiveadvices < ActiveRecord::Migration
  def change
    create_table :giveadvices do |t|

      t.timestamps
    end
  end
end
