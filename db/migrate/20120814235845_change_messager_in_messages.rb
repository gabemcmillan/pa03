class ChangeMessagerInMessages < ActiveRecord::Migration
  def up
    change_column :messages, :messager, :text, :limit => nil
  end

  def down
  end
end
