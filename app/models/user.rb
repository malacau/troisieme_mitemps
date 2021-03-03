class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  validates :nickname, presence: true, uniqueness: true

  # validate :photo_is_attached?
  has_many :messages
  has_many :participations
  has_many :line_ups
  has_many :ligues

  after_create :create_current_line_up

  def current_line_up
    # line_ups.where(round: Round.current).first
    line_ups.last
  end

  def update_participation_score
    self.participations.each do |participation|
      participation.score += current_line_up.score
      participation.save
    end
  end

  def create_current_line_up
    # current_round = Round.current
    current_round = Round.last
    if current_line_up
      selections = current_line_up.selections
      line_up = current_line_up.dup
      line_up.score = 0
      line_up.round = current_round
      line_up.save
      selections.each do |prev_selection|
        sel = prev_selection.dup
        sel.line_up = line_up
        sel.rating = 0
        sel.save
      end
    else
      n = 1
      line_up = self.line_ups.create(round: current_round)
      [0, 1, 0, 2, 2, 3, 3, 3, 4, 5, 7, 6, 6, 7, 8].each do |i|
        Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[i], terrain_position: n)
        n += 1
      end
    end
  end
end

  # def photo_is_attached?
  #   self.photo.attached?
  # end


# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[0])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[1])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[0])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[2])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[2])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[3])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[3])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[3])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[4])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[5])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[7])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[6])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[6])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[7])
# Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[8])
