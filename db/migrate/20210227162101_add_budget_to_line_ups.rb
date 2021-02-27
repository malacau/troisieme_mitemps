class AddBudgetToLineUps < ActiveRecord::Migration[6.0]
  def change
    add_column :line_ups, :budget, :integer, default: 200
  end
end
