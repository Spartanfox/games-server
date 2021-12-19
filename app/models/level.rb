class Level < ApplicationRecord
  belongs_to :game
  has_many :highscores, dependent: :destroy
end
