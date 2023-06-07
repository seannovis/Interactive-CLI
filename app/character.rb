require 'active_record'

class Character < ActiveRecord::Base
    belongs_to :game
    belongs_to :genre


    def self.show_characters
        puts "Characters"
        puts "ID\t\tName\t\t\t\t\tGender\t\t\tSuperpower"
        all.each do |c|
            printf("%-3d\t\t%-40s%-24s%-30s\n", c.id, c.name, c.gender, c.superpower)
        end
    end

    def self.find_character_class(character)
        puts ""
        puts "Information about #{character.name}:"
        puts ""
        puts "Name: #{character.name}"            
        puts "Gender: #{character.gender}"
        puts "Superpower: #{character.superpower}"
        puts ""
    end

    def self.find_superpower_class(character)
        character.each do |char|
            puts ""
            puts "#{char.superpower} belongs to #{char.name}, who features in #{char.game.name}"
            puts ""
        end
    end

    def self.count_gender
        male_count = self.count do |char|
            char[:gender] == "Male"
        end

        female_count = self.count do |char|
            char[:gender] == "Female"
        end
        
        puts ""
        puts "There are #{male_count} males and #{female_count} females"
        puts ""
    end

end