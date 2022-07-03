require 'rails_helper'

RSpec.describe OpeningHour, type: :model do
  let(:opening_hour) { build(:opening_hour) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(opening_hour).to be_valid
    end

    it 'is invalid with name of day nonexistent' do
      opening_hour.day = "wrong"
      expect(opening_hour).not_to be_valid
    end
  end
end
