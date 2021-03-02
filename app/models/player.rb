class Player < ApplicationRecord
  belongs_to :team
  has_many :selections
  enum position: [:prop, :hooker, :locky, :thirdrow, :scrumhalf, :flyhalf, :centre, :wing, :fullback]

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.selectable_for(selection)
    self.includes(:team).where(position: selection.player.position)
          .order(:id)
          .where.not(id: selection.line_up.players.map(&:id))
  end

   def score
    if team.won?
      50
    elsif team.drawn?
      20
    else
      0
    end
  end
end
