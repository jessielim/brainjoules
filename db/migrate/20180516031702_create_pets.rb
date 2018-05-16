class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
    	t.string :name
    	t.string :species
    	t.integer :health_points
    	t.integer :experience_points
    	t.timestamps null: false
    end
  end
end
