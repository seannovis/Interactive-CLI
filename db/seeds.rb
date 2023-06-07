require_relative "../app/game"
require_relative "../app/character"
require_relative "../app/genre"
require 'faker'

30.times do 
    Game.create(
        name: Faker::Game.unique.title,
        platform: Faker::Game.platform,
        price: rand(50..100),
        genre_id: rand(1..10)
        
    )
end

10.times do 
    Genre.create(
        classification: Faker::Game.unique.genre 
    )
end

80.times do 
    Character.create(
        name: Faker::Superhero.unique.name,
        gender: Faker::Gender.binary_type,
        superpower: Faker::Superhero.power,
        game_id: rand(1..30),
        genre_id: rand(1..10)
    )
end