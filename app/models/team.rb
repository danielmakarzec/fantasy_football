class Team < ApplicationRecord
  belongs_to :users
  has_many :transfers, dependent: :destroy
  has_many :players, through: :transfers
end
