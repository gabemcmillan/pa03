class AddAdvisorIdToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :advisor_id, :integer
    
  end
end
