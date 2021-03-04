class DropPerformances < ActiveRecord::Migration[6.0]
  def change
    drop_table :performances
  end
end
