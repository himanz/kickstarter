class CreateBreakpoints < ActiveRecord::Migration
  def change
    create_table :breakpoints do |t|
      t.integer :pledge
      t.text :info
      t.string :pledge_title

      t.timestamps
    end
  end
end
