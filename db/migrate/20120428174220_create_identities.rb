class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :location
      t.string :timezone

      t.timestamps
    end
  end
end
