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

  def current_line_up
    line_ups.last 
  end

  # def create_current_line_up
  #   current_round = Round.where("game_date > ?", Date.today).order(:game_date, :desc).first
  #   if current_line_up
  #     line_up = LineUp.clone
  #     line_up.round = current_round
  #     line_up.save
  #   else
  #     self.line_ups.create(round: current_round)
  #     15.times 
  #   end
  # end
  private

  # def photo_is_attached?
  #   self.photo.attached?
  # end

end
