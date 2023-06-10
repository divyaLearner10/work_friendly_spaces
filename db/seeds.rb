# require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# puts 'Creating 5 fake users..'
# user1 = User.new(first_name: "", last_name: "", email: "", password: "", phone_number: "", address: "")
# user1.save!
# user2 = User.new(first_name: "", last_name: "", email: "", password: "", phone_number: "", address: "")
# user2.save!
# user3 = User.new(first_name: "", last_name: "", email: "", password: "", phone_number: "", address: "")
# user3.save!
# user4 = User.new(first_name: "", last_name: "", email: "", password: "", phone_number: "", address: "")
# user4.save!
# user5 = User.new(first_name: "", last_name: "", email: "", password: "", phone_number: "", address: "")
# user5.save!
# puts 'Finished!'
require 'faker'

puts "Cleaning Database"
RentingSpace.delete_all
User.delete_all

users_data = [
  { first_name: "Alexandre", last_name: "Almeida", email: "alex@gmail.com", password: "123456" },
  { first_name: "Karina", last_name: "Basurto", email: "kar@gmail.com", password: "123456" },
  { first_name: "Divya", last_name: "Savai", email: "divya@gmail.com", password: "123456" },
  { first_name: "Christophe", last_name: "Deissenberg", email: "christophe@gmail.com", password: "123456" }
]

users = users_data.map do |user_data|
  User.create!(user_data)
end

puts 'Finished!'


puts 'Creating 15 fake renting_spaces..'
descriptions = [
  "Situated in the lively streets brimming with artistic energy in the heart of SoHo, New York City, experience the Soho North Meeting Room B!",

  "Our work studio space is dog friendly with Burgess Park minutes away, free on-street parking and a private gate with outdoor bike storage.",

  "Shoreditch Is home to a multitude of vintage clothes shops, cool coffee bars and retailers, a sought out area for anyone looking to do a Pop-up",

  "This beautiful workspcae with polished wooden floors, spotlighting, wifi, office equipment and fantastic window frontage this is not one to turn down.",

  "The space has many functions and can act like a creative hub for projects, photo studio, event space, pop up store and more.",

  "It's fully equipped with WIFI, ground floor access, 2 bathroom including a shower, fitting rooms, rails and shoe racks. It also has 2 Nanlite Forza 60 LED Light and a small white Colorama roll",

  "This work space is also perfect to host conferences, use as a short term office and more!",

  "This work space neighboring the Roundhouse in Camden is a unique and versatile venue that can accommodate a wide range of events and gatherings.",

  "Our Studio is easily accessible by public transportation with a variety of options for nearby parking. The location is also surrounded by numerous restaurants.",

  "Whether you are hosting a small meeting or a large-scale event, this space offers the perfect blend of functionality and style, making it a highly desirable choice for work event planners and organizers."
]

addresses = [
  "17 Rue du Faubourg Saint-Honoré, 75008 Paris, France",
  "1A Princes Street, Edinburgh EH2 2EQ, United Kingdom",
  "Piazza del Colosseo, 1, Rome, Italy",
  "Calle de Alcalá, 44, Spain",
  "Unter den Linden 77, Germany",
  "3A Trinity Street, Dublin 2, Ireland",
  "Prinsengracht 263-267, Amsterdam, Netherlands",
  "Plac Zamkowy 4, Warsaw, Poland",
  "Karl Johans gate 1, Oslo, Norway",
  "Vasileos Georgiou I 1, Athens, Greece"
]

index = 0
10.times do
  renting_space = RentingSpace.create!(
    name: Faker::Company.name,
    address: addresses[index],
    amenities: "#{Faker::House.room}, #{Faker::House.furniture}",
    user_id: users.sample.id,  # users.sample.id
    internet: true,
    # description: Faker::Lorem.unique,
    price: (500..1000).to_a.sample,
    description: descriptions[index]
  )
  renting_space.save!
  index += 1
  puts 'Finished!'
end
