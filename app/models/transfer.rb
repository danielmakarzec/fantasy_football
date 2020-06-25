class Transfer < ApplicationRecord
  belongs_to :team
  belongs_to :player

  def player_position
    player = Player.find(player_id)
    player.position
  end
end
