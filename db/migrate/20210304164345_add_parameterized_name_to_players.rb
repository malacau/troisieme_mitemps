class AddParameterizedNameToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :parameterized_name, :string
  end
end
