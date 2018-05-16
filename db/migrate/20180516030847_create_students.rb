class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
    	t.string :name, null: false
    	t.string :parents_email
    	t.integer :parents_contact
    	t.integer :score, default: 0
    	t.integer :token, default: 0

    	t.timestamps null: false
    end

    add_index :students, :name
  end
end
