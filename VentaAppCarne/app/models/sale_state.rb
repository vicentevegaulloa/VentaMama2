class SaleState < ApplicationRecord
  belongs_to :sale
  belongs_to :state
end
