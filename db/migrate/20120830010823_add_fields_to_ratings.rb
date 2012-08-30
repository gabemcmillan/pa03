class AddFieldsToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :rating_select, :string
    add_column :ratings, :advicepost_id, :integer
  end
end
