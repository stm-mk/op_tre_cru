# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create!(
  [
    {name: "トレマ"},
    {name: "イベント"},
    {name: "絆決戦"},
    {name: "闘技場"},
    {name: "決戦"},
    {name: "特訓の森"},
    {name: "ガープからの挑戦!"},
    {name: "大航海"},
  ]
)



100.times do |index|
  playStyle = ['enjoy', 'gachi'] 
  tags = Tag.all
  count = rand(1..8)
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
    friend_level: rand(100..1000),
    tags: tags.sample(count)
  )
end

User.create!(
  name: "Test01",
  email: "test01@example.com",
  password: "test01",
  password_confirmation: "test01"
)

100.times do |index|
  Character.create!(
    name: "キャラクター#{index}",
    element: rand(1..5)
  )
end