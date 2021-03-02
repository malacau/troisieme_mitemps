class AddResultsToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :results, :integer
  end
end
