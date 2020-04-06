class TeamSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :players
end
