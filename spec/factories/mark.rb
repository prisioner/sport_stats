FactoryBot.define do
  factory :mark do
    title { Faker::Book.title }
  end
end
