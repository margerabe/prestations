require 'rails_helper'

RSpec.describe Prestation, type: :model do
  let(:prestation)  { build(:prestation) }
  let(:prestation2) { build(:prestation, reference: prestation.reference) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(prestation).to be_valid
    end

    it 'is invalid without reference' do
      prestation.reference = nil
      expect(prestation).not_to be_valid
    end

    it 'reference must be unique' do
      prestation.save
      expect(prestation2).not_to be_valid
    end
  end
end
