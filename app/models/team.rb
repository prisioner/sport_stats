class Team < ApplicationRecord
  has_many :players
  has_many :games, -> (team) { unscope(:where).where("team_a_id = :team_id OR team_b_id = :team_id", team_id: team.id) }
end
