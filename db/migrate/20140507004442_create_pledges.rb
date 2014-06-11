class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :project_id
      t.integer :breakpoint_id
      t.timestamps
    end
  end
end
