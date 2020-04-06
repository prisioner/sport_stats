class GameSerializer < ActiveModel::Serializer
  attributes :id, :game_started_at
  belongs_to :team_a
  belongs_to :team_b

  def game_started_at
    object.game_started_at.iso8601
  end
end
