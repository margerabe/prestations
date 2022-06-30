class ProPrestation < ApplicationRecord
  self.table_name = 'prestations_pros'

  belongs_to :pro
  belongs_to :prestation
end
