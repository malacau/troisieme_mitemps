class AddDetailsToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :try, :integer, default: 0
    add_column :players, :penalty, :integer, default: 0
    add_column :players, :conversion, :integer, default: 0
    add_column :players, :yellow_card, :integer, default: 0
    add_column :players, :red_card, :integer, default: 0
  end
end
