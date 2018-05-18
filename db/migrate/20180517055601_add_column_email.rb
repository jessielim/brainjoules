class AddColumnEmail < ActiveRecord::Migration[5.1]
  def change
  	add_column :students, :parents_email, :string
  end
end
