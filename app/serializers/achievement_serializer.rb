class AchievementSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :player
  belongs_to :mark
  belongs_to :game
end
