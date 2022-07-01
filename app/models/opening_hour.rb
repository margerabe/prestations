class OpeningHour < ApplicationRecord
  belongs_to :pro

  validates :day, inclusion: { in: Date::DAYNAMES.map(&:downcase) }
end
