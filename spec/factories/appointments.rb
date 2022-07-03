FactoryBot.define do
  factory :appointment do
    association :pro
    starts_at { "2022-06-30 19:59:42" }
    ends_at { "2022-06-30 19:59:42" }
  end
end
