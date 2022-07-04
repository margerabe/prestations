require 'rails_helper'

describe MatchPro do
  # Booking:
  # Prestation(s): man_haircut, woman_haircut
  # Address: 24, Rue Chaptal, Paris
  # Time: next Tuesday, 14:00

  # the only pro that matches all criteria
  let(:pro1)        { create(:pro, name: 'Pro1', address: "24 Rue Chaptal, Paris", max_kilometers: 3) }
  # will be excluded based on opening hour - day
  let(:pro2)        { create(:pro, name: 'Pro2', address: "26 Rue Chaptal, Paris", max_kilometers: 5) }
  # will be excluded based on distance
  let(:pro3)        { create(:pro, name: 'Pro3', address: "99 Rue Olivier de Serres, Paris", max_kilometers: 2) }
  # will be excluded based on prestation
  let(:pro4)        { create(:pro, name: 'Pro4', address: "7 Rue Ballu, Paris", max_kilometers: 9) }
  # will be excluded based on opening hour - hour
  let(:pro5)        { create(:pro, name: 'Pro5', address: "5 Rue Ballu, Paris", max_kilometers: 5) }
  # will be excluded on availability
  let(:pro6)        { create(:pro, name: "Pro6", address: "26 Rue Chaptal, Paris", max_kilometers: 4) }

  let(:prestation1) { create(:prestation, reference: 'man_haircut', duration: 30) }
  let(:prestation2) { create(:prestation, reference: 'woman_haircut', duration: 45) }
  let(:prestation3) { create(:prestation, reference: 'woman_shampoo', duration: 45) }
  let(:prestation4) { create(:prestation, reference: 'woman_brushing', duration: 60) }

  let(:opening_hour1) { create(:opening_hour, day: 'tuesday', starts_at: '10:00', ends_at: "18:00", pro: pro1) }
  let(:opening_hour2) { create(:opening_hour, day: 'monday', starts_at: '20:00', ends_at: "22:00", pro: pro2) }
  let(:opening_hour4) { create(:opening_hour, day: 'tuesday', starts_at: '09:00', ends_at: "19:00", pro: pro4) }
  let(:opening_hour5) { create(:opening_hour, day: 'tuesday', starts_at: '21:00', ends_at: "23:00", pro: pro5) }
  let(:opening_hour5) { create(:opening_hour, day: 'tuesday', starts_at: '09:00', ends_at: "19:00", pro: pro6) }

  let(:next_tuesday)  { (Date.today.next_occurring(:tuesday).beginning_of_day + 14.hours).in_time_zone("Europe/Paris") }
  let(:next_wednesday)  do
    (Date.today.next_occurring(:wednesday).beginning_of_day + 14.hours).in_time_zone("Europe/Paris")
  end
  let(:appointment1)  { create(:appointment, starts_at: next_wednesday, ends_at: next_wednesday + 1.hour, pro: pro1) }
  let(:appointment6)  { create(:appointment, starts_at: next_tuesday, ends_at: next_tuesday + 2.hours, pro: pro6) }

  let(:booking) do
    create(:booking, address: "24 Rue Chaptal, Paris",
                     starts_at: next_tuesday)
  end
  let(:match_pro) { described_class.new(booking: booking).call }

  describe '.call' do
    context 'with the right parameters' do
      before do
        booking.prestations << [prestation1, prestation2]

        opening_hour1
        opening_hour2
        opening_hour5

        appointment1
        appointment6

        pro1.prestations << [prestation1, prestation2]
        pro2.prestations << [prestation1, prestation2, prestation3]
        pro3.prestations << [prestation1, prestation2, prestation4]
        pro4.prestations << [prestation1, prestation4]
        pro5.prestations << [prestation1, prestation2]
        pro6.prestations << [prestation1, prestation2]
      end

      it 'returns the correct pro(s)' do
        expect(match_pro).to eq([pro1])
      end
    end
  end
end
