class Client < ApplicationRecord
  has_one :direction
  has_many :sales
end
