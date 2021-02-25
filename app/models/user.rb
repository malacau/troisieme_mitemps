class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  validates :nickname, presence: true, uniqueness: true

   validates :photo, presence: true

  # validate :photo_is_attached?


  has_many :messages
  has_many :participations
  has_many :line_ups
  has_many :ligues

  private

  # def photo_is_attached?
  #   self.photo.attached?
  # end

end
