FactoryBot.define do
  factory :game do
    association :team_a, factory: :team
    association :team_b, factory: :team
    game_started_at { Faker::Time.between(from: 60.days.ago, to: 1.day.ago) }
  end
end
