class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :full_name
  belongs_to :team
end
