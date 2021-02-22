class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  validates :nickname, presence: true
  validates :photo, presence: true
  has_many :messages 
  has_many :participations
  has_many :line_ups
  has_many :ligues
end
