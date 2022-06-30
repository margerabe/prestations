class Prestation < ApplicationRecord
  has_many :pro_prestations
  has_many :pros, through: :pro_prestations
end
