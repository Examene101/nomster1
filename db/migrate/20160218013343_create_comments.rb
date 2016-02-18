class CreateComments < ActiveRecord::Migration
  def change
  	# field to keep track of messsage and ratiing of comment 
    create_table :comments do |t|
    	t.text :message
    	t.string :rating

    	t.integer :user_id
    	t.integer :place_id

      t.timestamps
    end
    # index to lookup different databases
    add_index :comments, [:user_id, :place_id]
    add_index :comments, :place_id

  end
end
