class AddFields02ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :agree_emails, :boolean, :default => false
  end
end
