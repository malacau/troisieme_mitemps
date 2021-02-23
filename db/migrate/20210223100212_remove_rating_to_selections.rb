class RemoveRatingToSelections < ActiveRecord::Migration[6.0]
  def change
    remove_column :selections, :rating
  end
end
