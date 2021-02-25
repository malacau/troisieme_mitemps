# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'

Player.destroy_all
Team.destroy_all
Participation.destroy_all
Ligue.destroy_all
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
  players = Player.create([
    {
      first_name: 'default',
      last_name: 'default',
      team: Team.find_by_name('Default'),
      position: 'prop',
    },
    {
      first_name: 'default',
      last_name: 'default',
      team: Team.find_by_name('Default'),
      position: 'hooker',
    },
    {
      first_name: 'default',
      last_name: 'default',
      team: Team.find_by_name('Default'),
      position: 'locky',
    },
    {
      first_name: 'default',
      last_name: 'default',
      team: Team.find_by_name('Default'),
      position: 'thirdrow',
    },
    {
      first_name: 'default',
      last_name: 'default',
      team: Team.find_by_name('Default'),
      position: 'scrumhalf',
    },
    {
      first_name: 'default',
      last_name: 'default',
      team: Team.find_by_name('Default'),
      position: 'flyhalf',
    },
    {
      first_name: 'default',
      last_name: 'default',
      team: Team.find_by_name('Default'),
      position: 'centre',
    },
    {
      first_name: 'default',
      last_name: 'default',
      team: Team.find_by_name('Default'),
      position: 'wing',
    },
    {
      first_name: 'default',
      last_name: 'default',
      team: Team.find_by_name('Default'),
      position: 'fullback',
    },

  ])
end

puts "Fin de la création des Seeds players"

# puts "Début création des Seeds Users"
# users = User.create([
#   {
#     nickname: "Quentin",
#     email: "quentin@example.fr",
#     password: "azerty",
#     password_confirmation: "azerty"
#   },
#   {
#     nickname: "Gabriel",
#     email: "gabriel@example.fr",
#     password: "azerty",
#     password_confirmation: "azerty"
#   },
#   {
#     nickname: "Benjamin",
#     email: "benjamin@example.fr",
#     password: "azerty",
#     password_confirmation: "azerty"
#   },
#   {
#     nickname: "Benoit",
#     email: "benoit@example.fr",
#     password: "azerty",
#     password_confirmation: "azerty"
#   },
#   {
#     nickname: "Maxime",
#     email: "maxime@example.fr",
#     password: "azerty",
#     password_confirmation: "azerty"
#   },
#   {
#     nickname: "Antoine",
#     email: "antoine@example.fr",
#     password: "azerty",
#     password_confirmation: "azerty"
#   },
#   {
#     nickname: "Bryan",
#     email: "bryan@example.fr",
#     password: "azerty",
#     password_confirmation: "azerty"
#   },
#   {
#     nickname: "Marco",
#     email: "marco@example.fr",
#     password: "azerty",
#     password_confirmation: "azerty"
#   }

# ])

# puts "Fin de la création des Seeds Users"


