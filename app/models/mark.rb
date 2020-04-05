class Mark < ApplicationRecord
  has_many :completions, class_name: 'Achievement'
  has_many :players, through: :completions
end
