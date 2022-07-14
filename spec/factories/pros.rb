FactoryBot.define do
  factory :pro do
    name            { Faker::Name.name }
    address         { Faker::Address.full_address }
    max_kilometers  { Faker::Number.between(from: 1, to: 30) }
  end
end
