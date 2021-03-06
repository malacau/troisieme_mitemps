class LineUp < ApplicationRecord
  belongs_to :user
  belongs_to :round, optional: true
  has_many :selections, dependent: :destroy
  has_many :players, through: :selections
  has_many :teams, through: :players

  def total_line_up
    self.score = selections.map(&:rating).sum
    self.save
  end
end
