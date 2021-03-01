class LineUp < ApplicationRecord
  belongs_to :user
  belongs_to :round, optional: true
  has_many :selections, dependent: :destroy

    def score
      self.selections.map(&:rating).sum
    end
end
