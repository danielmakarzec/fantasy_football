class Player < ApplicationRecord
  has_many :transfers, dependent: :destroy
  has_many :teams, through: :transfers
end
