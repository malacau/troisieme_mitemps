class LineUp < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :selections
end
