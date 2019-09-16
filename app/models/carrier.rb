class Carrier < ApplicationRecord
  has_many :shipments
  validates :name, uniqueness: true

end
