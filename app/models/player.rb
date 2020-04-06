class Player < ApplicationRecord
  belongs_to :team
  has_many :games, -> (player) {
    unscope(:where).where("team_a_id = :team_id OR team_b_id = :team_id", team_id: player.team_id)
  }
  has_many :achievements
end
