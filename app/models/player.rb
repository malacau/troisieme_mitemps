require 'rest-client'
require 'json'
require 'byebug'

class Player < ApplicationRecord
  belongs_to :team
  has_many :selections
  enum position: [:prop, :hooker, :locky, :thirdrow, :scrumhalf, :flyhalf, :centre, :wing, :fullback]


  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.selectable_for(selection)
    self.includes(:team).where(position: selection.player.position)
          .order(:id)
          .where.not(id: selection.line_up.players.map(&:id))
  end

  def self.reinitialize_performances
    Player.all.each do |player|
      player.try = 0
      player.penalty = 0
      player.conversion = 0
      player.yellow_card = 0
      player.red_card = 0
      player.save!
    end
  end

  def self.update_events_players
    Player.reinitialize_performances
    result = RestClient::Request.execute(method: :get, url: 'https://rugby-live-data.p.rapidapi.com/fixtures/1230/2021', headers: {'x-rapidapi-key' => 'f48ded3530msha6a2e9cae31e548p1c1ce9jsn9a7da829c71b', 'x-rapidapi-host' => 'rugby-live-data.p.rapidapi.com'})
    json = JSON.parse(result.body)
    last_game_week = json["results"].select { |hash| hash["game_week"] == 17 }
    ids = last_game_week.map { |game| game["id"] }
    ids.each do |id|
      bonusresult = RestClient::Request.execute(method: :get, url: "https://rugby-live-data.p.rapidapi.com/match/#{id}", headers: {'x-rapidapi-key' => 'f48ded3530msha6a2e9cae31e548p1c1ce9jsn9a7da829c71b', 'x-rapidapi-host' => 'rugby-live-data.p.rapidapi.com'})
      json = JSON.parse(bonusresult.body)
      events = json["results"]["events"]
      events.each do |event|
        player_name = event["player_1_name"].parameterize
        player = Player.find_by_parameterized_name(player_name)
        event_type = event["type"]
        if player
          case event_type
          when "Try"
            player.try += 1
            player.save
          when "Penalty"
            player.penalty += 1
            player.save
          when "Conversion"
            player.conversion += 1
            player.save
          when "Yellow card"
            player.yellow_card += 1
            player.save
          when "Red card"
            player.red_card += 1
            player.save
          end
        end
      end
    end
  end

  def extra
    (try * 20) + (penalty * 10) + (conversion * 3) - (yellow_card * 10) - (red_card * 20)
  end



    def score
      if team.won?
          50
        elsif team.drawn?
          20
        elsif team.bonus_won?
          60
        elsif team.bonus_lost?
          10
        else
          0
      end
    end
end
