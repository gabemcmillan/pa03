class CreateGetadvices < ActiveRecord::Migration
  def change
    create_table :getadvices do |t|

      t.timestamps
    end
  end
end
