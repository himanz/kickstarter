class AddPledgeTotalToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :pledge_total, :integer
  end
end
