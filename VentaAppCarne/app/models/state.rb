class State < ApplicationRecord
  has_many :sale_states
  has_many :sales, through: :sale_states

end
