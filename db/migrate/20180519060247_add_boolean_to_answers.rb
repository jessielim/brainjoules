class AddBooleanToAnswers < ActiveRecord::Migration[5.1]
  def change
  	add_column :answers, :status, :boolean, default: false
  end
end
