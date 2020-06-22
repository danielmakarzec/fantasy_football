class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :second_name
      t.string :surname, null: false
      t.integer :points, default: 0
      t.string :club, null: false
      t.integer :value, default: 1_000_000
      t.string :position, null: false

      t.timestamps
    end
  end
end
