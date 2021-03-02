class Round < ApplicationRecord
    after_create :create_line_up_per_round

    def self.current 
        self.where("game_date > ?", Date.today).order(game_date: :desc).first
    end

    def create_line_up_per_round
        @users = User.all
        @round = Round.last
        @users.each do |user|
            n = 1
            line_up = LineUp.create(user: user, round: @round)
            [0,1,0,2,2,3,3,3,4,5,7,6,6,7,8].each do |i|
                Selection.create(line_up: line_up, player: Team.find_by_name('Default').players[i], terrain_position: n)
                n += 1
            end
        end
    end
end
