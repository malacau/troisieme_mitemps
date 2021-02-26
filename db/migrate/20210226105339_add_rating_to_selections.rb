class AddRatingToSelections < ActiveRecord::Migration[6.0]
  def change
    add_column :selections, :rating, :integer, default: 0
  end
end
