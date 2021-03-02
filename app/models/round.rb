class Round < ApplicationRecord
  after_create :new_round

  def self.current
    where("game_date > ?", Date.today).order(game_date: :desc).first
  end

  def new_round
    Team.update_result_teams
    @users = User.all
    @users.each do |user|
      user.current_line_up.selections.update_rating
      user.update_participation_score
      user.create_current_line_up
    end
  end
end
