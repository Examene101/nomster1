class AlterPlacesAddUserIdColumn < ActiveRecord::Migration
  def change
  	# add column to enter alter places
  	add_column :places, :user_id, :integer
  	add_index :places, :user_id
  end
end
