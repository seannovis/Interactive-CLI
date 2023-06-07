require 'active_record'

class Character < ActiveRecord::Base
    belongs_to :game
    belongs_to :genre

end