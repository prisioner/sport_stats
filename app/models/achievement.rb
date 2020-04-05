class Achievement < ApplicationRecord
  belongs_to :mark
  belongs_to :player
  belongs_to :game
end
