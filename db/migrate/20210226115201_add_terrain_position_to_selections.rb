class AddTerrainPositionToSelections < ActiveRecord::Migration[6.0]
  def change
    add_column :selections, :terrain_position, :integer
  end
end
