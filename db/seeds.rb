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
  { email: "alex@gmail.com", password: "123456" },
  { email: "kar@gmail.com", password: "123456" },
  { email: "dyvia@gmail.com", password: "123456" },
  { email: "christophe@gmail.com", password: "123456" }
]

users = users_data.map do |user_data|
  User.create!(user_data)
end

puts 'Creating 50 fake renting_spaces...'
10.times do
  RentingSpace.create!(
    name: Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    amenities: "#{Faker::House.room}, #{Faker::House.furniture}",
    user_id: users.sample.id,
    internet: true
  )
end

puts 'Finished!'
