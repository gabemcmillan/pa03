class FixcolumnnameAdvisors < ActiveRecord::Migration
  def change
    change_table :advisors do |t|
      t.rename :firstname, :first_name
      t.rename :lastname, :last_name
    end
  end
  
  

  def down
  end
end
