require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
User.destroy_all
Channel.destroy_all

channels = ["general","react","paris"]

user_2 = User.create(
  email: 'hello@gmail.com',
  password: 'hey123'
)

user_3 = User.create(
  email: 'react_redux@gmail.com',
  password: 'Wagon_123'
)

user_4 = User.create(
  email: 'holasenor@gmail.com',
  password: 'taco_luvr123'
)

puts "created #{User.all.count} users"

channels.each_with_index do |channel, index|

  channel = Channel.create(
    name: "#{channel}"
    )

  User.all.each do |user|
    Message.create(
      channel: channel,
      user: user,
      content: Faker::Quote.famous_last_words
      )
  end
  puts "#{channel.name} created"
  puts "created #{Message.all.count} messages"
end



Faker::Quote.famous_last_words
