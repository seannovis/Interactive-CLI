class CreateGenre < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :classification
    end
  end
end
