class Appointment < ApplicationRecord
  belongs_to :pro

  validate :start_end_datetime_checks

  def start_end_datetime_checks
    if ends_at < starts_at
      errors.add(:starts_at, '- Start date must be earlier than end date')
      errors.add(:ends_at, '- End date must be later than start date')
    end
  end
end
