class Round < ApplicationRecord
    def self.current 
        self.where("game_date > ?", Date.today).order(game_date: :desc).first
    end
end
