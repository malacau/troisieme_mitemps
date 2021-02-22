class CreateSelections < ActiveRecord::Migration[6.0]
  def change
    create_table :selections do |t|
      t.integer :rating
      t.references :line_up, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
