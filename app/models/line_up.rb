class LineUp < ApplicationRecord
  belongs_to :user
  belongs_to :round, optional: true
  has_many :selections

  def score
    self.selections.map(&:rating).sum
  end
end
