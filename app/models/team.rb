require 'rest-client'
require 'json'

class Team < ApplicationRecord
  has_many :players
  enum results: [:won, :drawn, :lost]

  # def score
  #   if won?
  #     50
  #   elsif drawn?
  #     20
  #   else
  #     0
  #   end
  # end

  def self.update_result_teams
    result = RestClient::Request.execute(method: :get, url: 'https://rugby-live-data.p.rapidapi.com/fixtures/1230/2021', headers: {'x-rapidapi-key' => 'b68feda314mshc3fa35e38ccd559p1729eajsn8ecb020639db', 'x-rapidapi-host' => 'rugby-live-data.p.rapidapi.com'})
    json = JSON.parse(result.body)
    last_game_week = json["results"].select { |hash| hash["game_week"] == 17 }
    Team.all.each do |team|
      last_game_week.each do |game|
        if game.values.include?(team.city)
          if game.key(team.city) == "home"
            if game["home_score"].to_i > game["away_score"].to_i
              team.won!
            elsif game["home_score"].to_i < game["away_score"].to_i
              team.lost!
            else
              team.drawn!
            end
          else
            if game["away_score"].to_i > game["home_score"].to_i
              team.won!
            elsif game["away_score"].to_i < game["home_score"].to_i
              team.lost!
            else
              team.drawn!
            end
          end
        end
      end
    end
  end
end

