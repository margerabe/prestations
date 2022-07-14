FactoryBot.define do
  factory :booking do
    email       { Faker::Internet.email }
    name        { Faker::Name.name }
    starts_at   { Faker::Date.forward(days: 3) }
    address     { Faker::Address.full_address }
  end
end
