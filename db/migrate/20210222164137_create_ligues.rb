class CreateLigues < ActiveRecord::Migration[6.0]
  def change
    create_table :ligues do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.string :password
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
