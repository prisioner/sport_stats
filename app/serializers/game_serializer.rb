class GameSerializer < ActiveModel::Serializer
  attributes :id, :game_started_at
  belongs_to :team_a
  belongs_to :team_b
end
