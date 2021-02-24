class Player < ApplicationRecord
  belongs_to :team
  has_many :selections
  enum position: [:prop, :hooker, :locky, :thirdrow, :scrumhalf, :flyhalf, :centre, :wing, :fullback]
end
