class AddField02ToAdvicepost < ActiveRecord::Migration
  def change
    add_column :adviceposts, :rating_select, :string
  end
end
