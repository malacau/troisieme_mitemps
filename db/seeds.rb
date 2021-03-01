# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'


puts "Destroy line_ups"
LineUp.destroy_all
puts "Destroy rounds"
Player.destroy_all
puts "Destroy teams"
Team.destroy_all
puts "Destroy ligues"
Ligue.destroy_all
puts "Destroy selections"
Round.destroy_all
puts "Destroy users"
User.destroy_all


puts "Début création des seeds teams"
  teams = Team.create([
    {
      name: 'Agen',
      icon: 'maillot-agen.png'
    },
    {
      name: 'Bayonne',
      icon: 'maillot-bayonne.png'
    },
    {
      name: 'Union Bordeaux Begles',
      icon: 'maillot-bordeaux-begles.png'
    },
    {
      name: 'Brive',
      icon: 'maillot-brive.png'
    },
    {
      name: 'Castres',
      icon: 'maillot-castres.png'
    },
    {
      name: 'Clermont',
      icon: 'maillot-clermont.png'
    },
    {
      name: 'La Rochelle',
      icon: 'maillot-la-rochelle.png'
    },
    {
      name: 'LOU',
      icon: 'maillot-lyon.png'
    },
    {
      name: 'Montpellier',
      icon: 'maillot-montpellier.png'
    },
    {
      name: 'Pau',
      icon: 'maillot-pau.png'
    },
    {
      name: 'Racing Metro 92',
      icon: 'maillot-racing-92.png'
    },
    {
      name: 'Stade Français',
      icon: 'maillot-stade-francais.png'
    },
    {
      name: 'Stade Toulousain',
      icon: 'maillot-stade-toulousain.png'
    },
    {
      name: 'Toulon',
      icon: 'maillot-toulon.png'
    },
    {
      name: 'Default',
      icon: 'maillot-default-white.png'
    }
  ])

puts "Fin de la création des Seeds teams"

puts "Début création des Seeds players"
data = []
player_array = []

doc = Nokogiri::HTML(URI.open('http://www.itsrugby.co.uk/playersearch.html'))
doc.search('#noir').each do |link|
  data << link.text
end
 player_array = data.each_slice(3).to_a
 player_array.delete_at(42)
 player_array.each do |player|
  names = []
  nom = player[0]
  names = nom.split(",")
  position = player[1].downcase.strip.gsub(' ', '')
  if position == "lock"
    position = "locky"
  end

  if Team.find_by_name(player[2])
    joueur = Player.create!(
      first_name: names[1],
      last_name: names[0],
      position: position,
      team: Team.find_by_name(player[2])
    )
  end
end
players = Player.create([
  {
    first_name: '',
    last_name: 'Ajouter un joueur',
    team: Team.find_by_name('Default'),
    position: 'prop',
  },
  {
    first_name: '',
    last_name: 'Ajouter un joueur',
    team: Team.find_by_name('Default'),
    position: 'hooker',
  },
  {
    first_name: '',
    last_name: 'Ajouter un joueur',
    team: Team.find_by_name('Default'),
    position: 'locky',
  },
  {
    first_name: '',
    last_name: 'Ajouter un joueur',
    team: Team.find_by_name('Default'),
    position: 'thirdrow',
  },
  {
    first_name: '',
    last_name: 'Ajouter un joueur',
    team: Team.find_by_name('Default'),
    position: 'scrumhalf',
  },
  {
    first_name: '',
    last_name: 'Ajouter un joueur',
    team: Team.find_by_name('Default'),
    position: 'flyhalf',
  },
  {
    first_name: '',
    last_name: 'Ajouter un joueur',
    team: Team.find_by_name('Default'),
    position: 'centre',
  },
  {
    first_name: '',
    last_name: 'Ajouter un joueur',
    team: Team.find_by_name('Default'),
    position: 'wing',
  },
  {
    first_name: '',
    last_name: ' ',
    team: Team.find_by_name('Default'),
    position: 'fullback',
  },

])

puts "Fin de la création des Seeds players"


# puts "Début création des Seeds Users"
# user = User.new(
#     nickname: "Quentin",
#     email: "quentin@example.fr",
#     password: "azerty",
#     photo: "https://ca.slack-edge.com/T02NE0241-U01HRDXMRNJ-553c0cb660fa-512.jpeg"
#   )
# user_photo = URI.open('https://ca.slack-edge.com/T02NE0241-U01HRDXMRNJ-553c0cb660fa-512.jpeg')
# user2 = User.create(
#     nickname: "Gabriel",
#     email: "gabriel@example.fr",
#     password: "azerty",
#     photo: "https://ca.slack-edge.com/T02NE0241-U01HRJNF938-af9037e183ed-512.jpeg"
#   )
# user3 = User.create(
#     nickname: "Benjamin",
#     email: "benjamin@example.fr",
#     password: "azerty",
#     photo: "https://ca.slack-edge.com/T02NE0241-U01J0KFJJH1-53dbc03e5446-512.jpeg"
#   )
# user4 = User.create(
#     nickname: "Benoit",
#     email: "benoit@example.fr",
#     password: "azerty",
#     photo: "https://ca.slack-edge.com/T02NE0241-U01JB57C8GH-d75cfc352f3d-512.jpeg"
#   )
# user5 = User.create(
#     nickname: "Maxime",
#     email: "maxime@example.fr",
#     password: "azerty",
#     photo: "https://ca.slack-edge.com/T02NE0241-U01HVGWM78V-ca173ef3cac3-512.jpeg"
#   )
# user6 = User.create(
#     nickname: "Antoine",
#     email: "antoine@example.fr",
#     password: "azerty",
#     photo: "https://ca.slack-edge.com/T02NE0241-U01HYLYUAP5-cb0874fd17d0-512.jpeg"
#   )
# user7 = User.create(
#     nickname: "Bryan",
#     email: "bryan@example.fr",
#     password: "azerty",
#     photo: "https://ca.slack-edge.com/T02NE0241-U01HRFZ8SP8-b9dbacfc72df-512.jpeg"
#   )
# user8 = User.create(
#     nickname: "Marco",
#     email: "marco@example.fr",
#     password: "azerty",
#     photo: "https://ca.slack-edge.com/T02NE0241-U01HV81Q1HT-cb8748b0be8a-512.jpeg"
#   )
# puts "Fin de la création des Seeds Users"
puts "Début mise à jour de la côte des joueurs"
  default = Team.find_by(name: 'Default')
    default.players.each do |player| player.cote = 0
    player.save
  end

  agen = Team.find_by(name: 'Agen')
    agen.players.each do |player| player.cote = 5
    player.save
  end

  bayonne = Team.find_by(name: 'Bayonne')
    bayonne.players.each do |player| player.cote = 6
    player.save
  end

  ubb = Team.find_by(name: 'Union Bordeaux Begles')
  ubb.players.each do |player| player.cote = 14
    player.save
  end

  brive = Team.find_by(name: 'Brive')
    brive.players.each do |player| player.cote = 10
    player.save
  end

  castres = Team.find_by(name: 'Castres')
    castres.players.each do |player| player.cote = 9
    player.save
  end

  clermont = Team.find_by(name: 'Clermont')
    clermont.players.each do |player| player.cote = 15
    player.save
  end

  larochelle = Team.find_by(name: 'La Rochelle')
    larochelle.players.each do |player| player.cote = 17
    player.save
  end

  lou = Team.find_by(name: 'LOU')
    lou.players.each do |player| player.cote = 12
    player.save
  end

  montpellier = Team.find_by(name: 'Montpellier')
    montpellier.players.each do |player| player.cote = 8
    player.save
  end

  pau = Team.find_by(name: 'Pau')
    pau.players.each do |player| player.cote = 7
    player.save
  end

  racing = Team.find_by(name: 'Racing Metro 92')
    racing.players.each do |player| player.cote = 16
    player.save
  end

  stadefr = Team.find_by(name: 'Stade Français')
    stadefr.players.each do |player| player.cote = 11
    player.save
  end

  toulouse = Team.find_by(name: 'Stade Toulousain')
    toulouse.players.each do |player| player.cote = 18
    player.save
  end

  toulon = Team.find_by(name: 'Toulon')
    toulon.players.each do |player| player.cote = 13
    player.save
  end

puts "Fin mise à jour de la côte des joueurs"



puts "Début création du round"
  Round.create(game_date: Date.tomorrow)
puts "Fin création du round"



