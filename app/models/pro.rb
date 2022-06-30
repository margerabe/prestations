class Pro < ApplicationRecord
  has_many :pro_prestations
  has_many :prestations, through: :pro_prestations
end
