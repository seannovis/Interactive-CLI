require 'active_record'

class Game < ActiveRecord::Base
    has_many :characters
    belongs_to :genre

    def self.list_characters
        puts ""
        all.each do |game|
            puts "Characters for #{game.name}:"
            if game.characters.count > 0
                game.characters.each do |character|
                    puts "#{character.name}"
                end
            else
                puts "No characters for #{game.name}"
            end
            puts "-------------------------"
        end
    end

    def self.show_games
        puts "Games"
        puts "ID\t\tName\t\t\t\t\t\tPlatform\t\t\tPrice"
        all.each do |g|
            printf("%-3d\t\t%-48s%-32s%.2f\n", g.id, g.name, g.platform, g.price)
        end
    end

    def self.find_game_class(game)
        puts ""
        puts "Information about #{game.name}:"
        puts ""            
        puts "ID: #{game.id}"
        puts "Platform: #{game.platform}"
        puts "Name: #{game.name}"            
        puts "Price: #{game.price}"
        puts ""
    end

    def self.max_price
        maxi = all.max_by do |game|
            game.price
        end

        puts ""
        puts "#{maxi.name} is the most expensive game, with a price of $#{maxi.price}"

        all.each do |game|
            if game.price === maxi.price
                if !maxi
                    puts "#{game.name} is the most expensive game, with a price of $#{game.price}"
                end
            end
        end
        puts ""
    end

    def self.min_price
        mini = all.min_by do |game|
            game.price
        end

        puts ""
        puts "#{mini.name} is the cheapest game, with a price of $#{mini.price}"
        
        all.each do |game|
            if game.price === mini.price
                if !mini
                    puts "#{game.name} is the cheapest game, with a price of $#{game.price}"
                end
            end
        end
        puts ""
    end
    
end