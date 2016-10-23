class AddUserIDtoTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :user_id, :string
  end
end
