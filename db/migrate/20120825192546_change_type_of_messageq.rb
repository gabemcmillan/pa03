class ChangeTypeOfMessageq < ActiveRecord::Migration


  def change
    change_column :messages, :messageq, :text
    remove_column :messages, :thread

  end
  
  
end
