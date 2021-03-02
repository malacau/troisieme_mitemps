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
    last_name: 'Ajouter joueur',
    team: Team.find_by_name('Default'),
    position: 'prop',
  },
  {
    first_name: '',
    last_name: 'Ajouter joueur',
    team: Team.find_by_name('Default'),
    position: 'hooker',
  },
  {
    first_name: '',
    last_name: 'Ajouter joueur',
    team: Team.find_by_name('Default'),
    position: 'locky',
  },
  {
    first_name: '',
    last_name: 'Ajouter joueur',
    team: Team.find_by_name('Default'),
    position: 'thirdrow',
  },
  {
    first_name: '',
    last_name: 'Ajouter joueur',
    team: Team.find_by_name('Default'),
    position: 'scrumhalf',
  },
  {
    first_name: '',
    last_name: 'Ajouter joueur',
    team: Team.find_by_name('Default'),
    position: 'flyhalf',
  },
  {
    first_name: '',
    last_name: 'Ajouter joueur',
    team: Team.find_by_name('Default'),
    position: 'centre',
  },
  {
    first_name: '',
    last_name: 'Ajouter joueur',
    team: Team.find_by_name('Default'),
    position: 'wing',
  },
  {
    first_name: '',
    last_name: 'Ajouter joueur',
    team: Team.find_by_name('Default'),
    position: 'fullback',
  },

])

puts "Fin de la création des Seeds players"


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

puts "Début création du round tomorrow"
  Round.create(game_date: Date.tomorrow)
puts "Fin création du round tomorrow"

puts "Début création des Seeds Users"
file = URI.open("http://res.cloudinary.com/dbmddnd6a/image/upload/v1613747135/Gabriel.jpg")
user1 = User.new(
    nickname: "Gabriel",
    email: "gabriel@example.fr",
    password: "azerty",
  )
user1.photo.attach(io: file, filename: 'Gabriel.jpg', content_type: 'image/jpg')
user1.save
file = URI.open("https://res.cloudinary.com/dbmddnd6a/image/upload/v1613747084/Quentin.jpg")
user2 = User.new(
    nickname: "Quentin",
    email: "quentin@example.fr",
    password: "azerty",
  )
user2.photo.attach(io: file, filename: 'Quentin.jpg', content_type: 'image/jpg')
user2.save
file = URI.open("https://res.cloudinary.com/dbmddnd6a/image/upload/v1614690022/Benjamin.jpg")
user3 = User.new(
    nickname: "Benjamin",
    email: "benjamin@example.fr",
    password: "azerty",
  )
user3.photo.attach(io: file, filename: 'Benjamin.jpg', content_type: 'image/jpg')
user3.save
file = URI.open("https://res.cloudinary.com/dbmddnd6a/image/upload/v1614689811/Benoit.png")
user4 = User.new(
    nickname: "Benoit",
    email: "benoit@example.fr",
    password: "azerty",
  )
user4.photo.attach(io: file, filename: 'Benoit.jpg', content_type: 'image/jpg')
user4.save
file = URI.open("https://res.cloudinary.com/dbmddnd6a/image/upload/v1614613419/Maxime.jpg")
user5 = User.new(
    nickname: "Maxime",
    email: "maxime@example.fr",
    password: "azerty",
  )
user5.photo.attach(io: file, filename: 'Maxime.jpg', content_type: 'image/jpg')
user5.save
file = URI.open("https://res.cloudinary.com/dbmddnd6a/image/upload/v1614689628/Antoine.jpg")
user6 = User.new(
    nickname: "Antoine",
    email: "antoine@example.fr",
    password: "azerty",
  )
user6.photo.attach(io: file, filename: 'Antoine.jpg', content_type: 'image/jpg')
user6.save
file = URI.open("https://res.cloudinary.com/dbmddnd6a/image/upload/v1614340483/Bryan.jpg")
user7 = User.new(
    nickname: "Bryan",
    email: "bryan@example.fr",
    password: "azerty",
  )
user7.photo.attach(io: file, filename: 'Bryan.jpg', content_type: 'image/jpg')
user7.save
file = URI.open("https://res.cloudinary.com/dbmddnd6a/image/upload/v1614613553/Marco.jpg")
user8 = User.new(
    nickname: "Marco",
    email: "marco@example.fr",
    password: "azerty",
  )
user8.photo.attach(io: file, filename: 'Marco.jpg', content_type: 'image/jpg')
user8.save
puts "Fin de la création des Seeds Users"


Round.create(game_date: Date.yesterday)
