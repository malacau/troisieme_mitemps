class AddAverageRatingToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :average_rating, :float
  end
end
