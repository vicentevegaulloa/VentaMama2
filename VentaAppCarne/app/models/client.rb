class Client < ApplicationRecord
  has_one :direction, dependent: :destroy
  has_many :sales
  accepts_nested_attributes_for :direction, :allow_destroy => true
  attr_accessor :direction
end
