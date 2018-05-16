class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|

    	t.string :name
    	t.integer :phone_number
    	t.timestamps null: false
    	
    end
  end
end
