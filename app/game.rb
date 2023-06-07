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

end