class AddCoteToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :cote, :integer, default: 5
  end
end
