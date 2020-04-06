FactoryBot.define do
  factory :team do
    title { Faker::Team.name }
  end
end
