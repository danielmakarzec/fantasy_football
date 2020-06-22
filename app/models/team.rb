class Team < ApplicationRecord
  belongs_to :user
  has_many :transfers, dependent: :destroy
  has_many :players, through: :transfers
end
