require 'rails_helper'

RSpec.describe Pro, type: :model do
  let(:appointment) { build(:appointment) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(appointment).to be_valid
    end

    it 'is invalid without name' do
      appointment.starts_at = Time.now + 2.hours
      appointment.ends_at = Time.now + 1.hour
      expect(appointment).not_to be_valid
    end
  end
end
