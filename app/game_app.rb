require_relative "./character"
require_relative "./game"
require_relative "./genre"

class GameApp

    def initialize
        puts "Games App"

        ActiveRecord::Base.establish_connection(
            adapter: "sqlite3",
            database: "db/development.db"
          )
      
          loop do
            choice = user_options
      
            if choice == "1"
              simple_methods
            elsif choice == "2"
              advanced_methods
            elsif choice == "3"
              puts "Thank you for using the app. Goodbye!"
              break
            else
              puts "Not a valid option"
            end
        end
    end      

    def user_options
        puts "OPTIONS"
        puts "1 - Simple Methods"
        puts "2 - Advanced Methods"
        puts "3 - Exit"

        puts "Enter your choice:"

        input = get_input
    end

    def simple_options
        puts "1 - Show all games"
        puts "2 - Show all characters"
        puts "3 - Find a game"
        puts "4 - Find a character"
        puts "5 - Find a character by superpower"
        puts "6 - Display most expensive game"
        puts "7 - Display cheapest game"
        puts "8 - Count genders"
        puts "9 - Go back to main menu"

        puts "Enter your choice:"

        input = get_input
    end

    def advanced_options
        puts "1 - List characters by game"
        puts "2 - List games by genre"
        puts "3 - Count number of games per genre"
        puts "4 - Go back to main menu"

        puts "Enter your choice:"

        input = get_input
    end


    def simple_methods
        puts "Simple Methods"

        loop do 
            choice = simple_options

            if choice === "1"
                show_games
            elsif choice === "2"
                show_characters
            elsif choice === "3"
                find_game
            elsif choice === "4"
                find_character
            elsif choice === "5"
                find_superpower
            elsif choice === "6"
                max_price
            elsif choice === "7"
                min_price
            elsif choice === "8"
                count_gender
            elsif choice === "9"
                break
            else
                puts "Not a valid option"
            end
        end
    end

    def advanced_methods
        puts "Advanced Methods"

        loop do
            choice = advanced_options

            if choice === "1"
                Game.list_characters
            elsif choice === "2"
                Genre.list_games
            elsif choice === "3"
                Genre.count_games
            elsif choice === "4"
                break
            else
                puts "Not a valid option"
            end
        end
    end

    def show_games
        puts "Games"
        puts "ID\t\tName\t\t\t\t\t\tPlatform\t\t\tPrice"
        Game.all.each do |g|
            printf("%-3d\t\t%-48s%-32s%.2f\n", g.id, g.name, g.platform, g.price)
        end
    end

    def show_characters
        puts "Characters"
        puts "ID\t\tName\t\t\t\t\tGender\t\t\tSuperpower"
        Character.all.each do |c|
            printf("%-3d\t\t%-40s%-24s%-30s\n", c.id, c.name, c.gender, c.superpower)
        end
    end

    def find_game
        puts "Please enter game title:"
        title = gets.chomp
        game = Game.find_by(name: title)

        if game
            puts ""
            puts "Information about #{title}:"
            puts ""
            puts "ID: #{game.id}"
            puts "Platform: #{game.platform}"
            puts "Name: #{game.name}"
            puts "Price: #{game.price}"
            puts ""
        else
            puts "No game found with the title #{title}!"
        end
    end

    def find_character
        puts "Please enter character name:"
        char_name = gets.chomp
        character = Character.find_by(name: char_name)

        if character
            puts ""
            puts "Information about #{char_name}:"
            puts ""
            puts "Name: #{character.name}"
            puts "Gender: #{character.gender}"
            puts "Superpower: #{character.superpower}"
            puts ""
        else
            puts "No character found with the name #{char_name}!"
        end
    end

    def find_superpower
        puts "Please enter a superpower:"
        power = gets.chomp
        characters = Character.where(superpower: power)

        if characters
            characters.each do |character|
                puts ""
                puts "#{character.superpower} belongs to #{character.name}, who features in #{character.game.name}"
                puts ""
            end
        else
            puts "#{power} superpower not found!"
        end
    end

    def max_price
        maxi = Game.all.max_by do |game|
            game.price
        end
        puts ""
        puts "#{maxi.name} is the most expensive game, with a price of $#{maxi.price}"
        puts ""
    end

    def min_price
        mini = Game.all.min_by do |game|
            game.price
        end
        puts ""
        puts "#{mini.name} is the cheapest game, with a price of $#{mini.price}"
        puts ""
    end

    def count_gender

        male_count = Character.count do |char|
            char[:gender] == "Male"
        end

        female_count = Character.count do |char|
            char[:gender] == "Female"
        end
        puts ""
        puts "There are #{male_count} males and #{female_count} females"
        puts ""
    end

    def get_input
        STDIN.gets.chomp
    end

end