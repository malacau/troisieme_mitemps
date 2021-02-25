class Player < ApplicationRecord
  belongs_to :team
  has_many :selections
  enum position: [:prop, :hooker, :locky, :thirdrow, :scrumhalf, :flyhalf, :centre, :wing, :fullback]

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
