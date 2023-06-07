class CreateGame < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :platform
      t.float :price
      t.integer :genre_id
    end
  end
end
