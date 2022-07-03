FactoryBot.define do
  factory :prestation do
    reference   { ['man_haircut', 'woman_shampoo', 'woman_haircut', 'woman_color', 'woman_brushing'].sample }
    duration    { [15, 30, 40, 45, 60].sample }
  end
end
