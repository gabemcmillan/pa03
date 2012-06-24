class CreateAdviceposts < ActiveRecord::Migration
  def change
    create_table :adviceposts do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :categoryname
      t.string :miniresume

      t.timestamps
    end
  end
end
