class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.text     "comment"
			t.integer  "project_id"
			t.integer  "user_id"
			t.datetime "created_at"
			t.datetime "updated_at"
			t.timestamps
		end
	end
end
