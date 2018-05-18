class ChangeQuizResultsTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :quiz_results
  end
end
