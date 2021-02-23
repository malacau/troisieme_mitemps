class RemoveScoreFromParticipations < ActiveRecord::Migration[6.0]
  def change
    remove_column :participations, :score
  end
end
