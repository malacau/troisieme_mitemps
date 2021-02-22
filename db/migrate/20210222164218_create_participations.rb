class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.integer :score
      t.references :ligue, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
