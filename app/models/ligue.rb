class Ligue < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  # validates :photo, presence: true
end
