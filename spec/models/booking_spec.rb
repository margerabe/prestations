require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:booking) { build(:booking) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(booking).to be_valid
    end

    it 'is invalid without name' do
      booking.name = nil
      expect(booking).not_to be_valid
    end

    it 'is invalid with invalid email' do
      booking.email = "thiswillfail"
      expect(booking).not_to be_valid
    end
  end
end
