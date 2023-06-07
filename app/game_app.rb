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
        puts "8 - Count genders per character"
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
                Game.show_games
            elsif choice === "2"
                Character.show_characters
            elsif choice === "3"
                find_game
            elsif choice === "4"
                find_character
            elsif choice === "5"
                find_superpower
            elsif choice === "6"
                Game.max_price
            elsif choice === "7"
                Game.min_price
            elsif choice === "8"
                Character.count_gender
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

    def find_game
        puts "Please enter game title:"
        title = gets.chomp
        game = Game.find_by(name: title)

        if game 
            Game.find_game_class(game)
        else
            puts "No game found with the title #{title}!"
        end
    end

    def find_character
        puts "Please enter character name:"
        char_name = gets.chomp
        character = Character.find_by(name: char_name)

        if character 
            Character.find_character_class(character)
        else 
            puts "No character found with the name #{char_name}!"
        end
    end

    def find_superpower 
        puts "Please enter a superpower:"
        power = gets.chomp
        character = Character.where(superpower: power)

        if character
            Character.find_superpower_class(character)
        else
            puts "#{power} superpower not found!"
        end
    end

    def get_input
        STDIN.gets.chomp
    end

end