FactoryBot.define do
  factory :player do
    full_name { Faker::Name.name }
    team
  end
end
