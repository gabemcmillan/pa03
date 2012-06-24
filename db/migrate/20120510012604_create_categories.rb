class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :categoryname
      t.string :categorydesc

      t.timestamps
    end
  end
end
