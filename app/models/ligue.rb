class Ligue < ApplicationRecord
  belongs_to :user
  has_many :participations
  has_many :messages
  has_one_attached :photo
  validates :name, presence: true
  # validates :photo, presence: true
end
