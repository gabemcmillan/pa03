class CreateRatings < ActiveRecord::Migration


  def self.up
    create_table :ratings do |t|
      t.integer :advisor_id
      t.integer :score
    end
  end

  def self.down
    drop_table :ratings
  end
  
  
  
end
