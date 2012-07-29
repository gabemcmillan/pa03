class AddAdvisorIdToAdviceposts < ActiveRecord::Migration
  def change
       add_column :adviceposts, :advisor_id, :integer
  end
end
