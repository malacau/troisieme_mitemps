class AddColumnsToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :carry_meter, :integer, default: 0
    add_column :teams, :tacle, :integer, default: 0
    add_column :teams, :turnover, :integer, default: 0
    add_column :teams, :defender_beaten, :integer, default: 0
  end
end
