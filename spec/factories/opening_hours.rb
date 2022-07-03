FactoryBot.define do
  factory :opening_hour do
    association :pro
    day         { Date::DAYNAMES.sample.downcase }
    starts_at   { "10:00" }
    ends_at     { "15:00" }
  end
end
