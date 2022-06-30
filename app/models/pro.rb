class Pro < ApplicationRecord
  has_many :pro_prestations
  has_many :prestations, through: :pro_prestations
  has_many :appointments, dependent: :destroy
  has_many :opening_hours, dependent: :destroy
end
