class CreateCharacter < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.string :superpower
      t.integer :game_id
      t.integer :genre_id
    end
  end
end
