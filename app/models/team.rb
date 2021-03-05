require 'rest-client'
require 'json'

class Team < ApplicationRecord
  has_many :players
  enum results: [:won, :drawn, :lost, :bonus_won, :bonus_lost]

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
    result = RestClient::Request.execute(method: :get, url: 'https://rugby-live-data.p.rapidapi.com/fixtures/1230/2021', headers: {'x-rapidapi-key' => 'f48ded3530msha6a2e9cae31e548p1c1ce9jsn9a7da829c71b', 'x-rapidapi-host' => 'rugby-live-data.p.rapidapi.com'})
    json = JSON.parse(result.body)
    last_game_week = json["results"].select { |hash| hash["game_week"] == 17 }
    Team.all.each do |team|
      last_game_week.each do |game|
        if game.values.include?(team.city)
          if game.key(team.city) == "home"
            if game["home_score"] > game["away_score"]
              if game["home_score"] - game["away_score"] > 10
                team.bonus_won!
              else
                team.won!
              end
            elsif game["home_score"] < game["away_score"]
              if game["away_score"] - game["home_score"] < 7
                team.bonus_lost!
              else
                team.lost!
              end
            else
              team.drawn!
            end
          else
            if game["away_score"] > game["home_score"]
              if game["away_score"] - game["home_score"] > 10
                team.bonus_won!
              else
                team.won!
              end
            elsif game["away_score"] < game["home_score"]
               if game["home_score"] - game["away_score"] < 7
                team.bonus_lost!
              else
                team.lost!
              end
            else
              team.drawn!
            end
          end
        end
      end
    end
  end
end

