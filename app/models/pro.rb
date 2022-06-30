class Pro < ApplicationRecord
  has_many :pro_prestations
  has_many :prestations, through: :pro_prestations
  has_many :appointments, dependent: :destroy
  has_many :opening_hours, dependent: :destroy

  validates_presence_of :name
  validates :max_kilometers, numericality: { greater_than_or_equal_to: 0 }
end
