class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :formation
      t.integer :budget, default: 99_000_000
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
