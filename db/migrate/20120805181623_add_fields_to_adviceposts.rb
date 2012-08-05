class AddFieldsToAdviceposts < ActiveRecord::Migration
  def change
    add_column :adviceposts, :website, :string
    add_column :adviceposts, :twitter, :string
    add_column :adviceposts, :linkedin, :string
    add_column :adviceposts, :status, :string
  end
end
