class SaleState < ApplicationRecord
  belongs_to :sale
  belongs_to :state
  validates :state_id, presence: true
end
