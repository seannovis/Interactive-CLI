require 'active_record'

class Genre < ActiveRecord::Base
    has_many :games
    has_many :characters, through: :games

    def self.list_games
        puts ""
        all.each do |genre|
            puts "Games for #{genre.classification}:"
            if genre.games.count > 0
                genre.games.each do |game|
                    puts "#{game.name}"
                end
            else 
                puts "No games for #{genre.classification}"
            end 
            puts "-------------------------"
        end
    end

    def self.count_games
        puts ""
        all.map do |genre|
            puts "#{genre.classification}: #{genre.games.count} games"
        end
        puts ""
    end

end