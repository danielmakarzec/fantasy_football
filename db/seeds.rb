# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Team.destroy_all

# Team.create(name: 'Hornets', formation: '1', color: 'green')

Player.destroy_all

CSV.foreach(Rails.root.join('lib/players_all.csv'), headers: true, col_sep: ',') do |row|
  Player.create(
    club: row[0],
    surname: row[1],
    second_name: (row[2] unless row[2] == '0'),
    name: row[3],
    position: row[4],
    value: rand(1..10) * 1_000_000
  )
end

Transfer.destroy_all

# t1 = Transfer.create
# t1.team = Team.first
# t1.player = Player.last
# t2 = Transfer.create
# t2.team = Team.first
# t2.player = Player.first
