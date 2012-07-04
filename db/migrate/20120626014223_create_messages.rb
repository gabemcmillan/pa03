class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :advisor_id
      t.integer :advicepost_id
      t.integer :thread
      t.string :messageq
      t.string :messager

      t.timestamps
    end
  end
end
