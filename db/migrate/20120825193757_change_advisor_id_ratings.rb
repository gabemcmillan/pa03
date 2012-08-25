class ChangeAdvisorIdRatings < ActiveRecord::Migration


  def change
    change_column :ratings, :advisor_id, :integer


  end
  
end
