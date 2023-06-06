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
puts "Cleaning Data Base"
RentingSpace.destroy_all
User.destroy_all
user1 = User.create!(email: "alex@gmail.com", password: "123456")
user2 = User.create!(email: "kar@gmail.com", password: "123456")
user3 = User.create!(email: "dyvia@gmail.com", password: "123456")
user4 = User.create!(email: "christophe@gmail.com", password: "123456")

users = [user1, user2, user3, user4]

puts 'Creating 50 fake renting_spaces..'
50.times do
  renting_space = RentingSpace.create!(
    name: Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    amenities: "#{Faker::House.room}, #{Faker::House.furniture}",
    user_id: users.sample.id,  # users.sample.id
    internet: true,
  )
  renting_space.save!
  puts 'Finished!'
end
