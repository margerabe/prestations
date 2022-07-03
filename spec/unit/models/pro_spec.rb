require 'rails_helper'

RSpec.describe Pro, type: :model do
  let(:pro) { build(:pro) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(pro).to be_valid
    end

    it 'is invalid without name' do
      pro.name = nil
      expect(pro).not_to be_valid
    end

    it 'is invalid with max_kilometers set to zero' do
      pro.max_kilometers = 0
      expect(pro).not_to be_valid
    end
  end
end
