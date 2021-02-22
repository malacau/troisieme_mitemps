class Player < ApplicationRecord
  belongs_to :team
  has_many :selections
  enum position: [:pilier, :talonneur, :deuxieme_ligne, :troisieme_ligne, :demi_melee, :demi_ouverture, :centre, :ailier, :arriere ]
end
