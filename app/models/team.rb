class Team < ApplicationRecord
  belongs_to :user
  has_many :transfers, dependent: :destroy
  has_many :players, through: :transfers

  validates :name, uniqueness: true
  FORMATIONS = %w(4-4-2 3-4-3 3-5-2)
  validates :formation, inclusion: { in: FORMATIONS }

  def goalkeepers_num
    2
  end

  def defenders_num
    formation.split('-').first.to_i + 1
  end

  def midfielders_num
    formation.split('-').second.to_i + 1
  end

  def forwards_num
    formation.split('-').third.to_i + 1
  end

  def goalkeepers
    transfers.select { |t| t.player_position == 'GK' }.map &:player
  end

  def defenders
    transfers.select { |t| t.player_position == 'D' }.map &:player
  end

  def midfielders
    transfers.select { |t| t.player_position == 'M' }.map &:player
  end

  def forwards
    transfers.select { |t| t.player_position == 'F' }.map &:player
  end

  def current_budget
    players.reduce(budget) { |players_cost, player| players_cost - player.value }
  end
end
