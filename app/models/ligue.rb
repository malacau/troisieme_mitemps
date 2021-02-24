class Ligue < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :messages, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  # validates :photo, presence: true
  after_create :owner_ligue_participation

  def owner_ligue_participation
    @participation = Participation.new
    @participation.user = user
    @participation.ligue = self
    @participation.save
  end
end
