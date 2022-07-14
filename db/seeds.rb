# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |index|
  playStyle = ['enjoy', 'gachi'] 
  user = User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      play_style: playStyle.sample,
      level: rand(100..1000),
      game_id: rand(100000000..999999999),
      password: "123456",
      password_confirmation: "123456"
  )
  Post.create!(
    user: user,
    title: "タイトル#{index}",
    description: "本文#{index}",
    friend_level: rand(100..1000)
  )
end
