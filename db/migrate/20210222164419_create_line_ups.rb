class CreateLineUps < ActiveRecord::Migration[6.0]
  def change
    create_table :line_ups do |t|
      t.integer :score
      t.references :user, null: false, foreign_key: true
      t.references :round, null: false, foreign_key: true

      t.timestamps
    end
  end
end
