class AddScoreToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_column :participations, :score, :integer, default: 0
  end
end
