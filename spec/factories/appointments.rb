FactoryBot.define do
  factory :appointment do
    association :pro
    starts_at   { "2022-06-30 10:00:00" }
    ends_at     { "2022-06-30 14:00:00" }
  end
end
