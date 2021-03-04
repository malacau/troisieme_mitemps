class Selection < ApplicationRecord
  belongs_to :line_up
  belongs_to :player


  def self.update_rating
    self.all.each do |selection|
      selection.update(rating: selection.player.score + selection.player.extra)
    end
  end
end
