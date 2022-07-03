require 'rails_helper'

describe MatchPro do
  let(:pro1)        { create(:pro, address: "14 Rue Moncey, Paris", max_kilometers: 3) }
  let(:pro2)        { create(:pro, address: "26 Rue Chaptal, Paris", max_kilometers: 5) }
  let(:pro3)        { create(:pro, address: "99 Rue Olivier de Serres, Paris", max_kilometers: 2) }

  let(:prestation1) { create(:prestation, reference: 'man_haircut') }
  let(:prestation2) { create(:prestation, reference: 'woman_haircut') }
  let(:prestation3) { create(:prestation, reference: 'woman_shampoo') }
  let(:prestation4) { create(:prestation, reference: 'woman_brushing') }

  let(:booking)     { create(:booking, address: "24 Rue Chaptal, Paris") }
  let(:match_pro) { described_class.new(booking: booking).call }

  describe '.call' do
    context 'with the right parameters' do
      before do
        pro1.prestations << [prestation1, prestation2]
        pro2.prestations << [prestation1, prestation2, prestation3]
        pro3.prestations << [prestation4]
        booking.prestations << prestation1

        match_pro
      end

      it '' do
      end

      it 'update meeting external id' do
        # expect(meeting.ext_id).to eq(request_response['id'])
        # expect(meeting.source).to eq(external_calendar)
      end
    end
  end
end
