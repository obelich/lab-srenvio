class Shipmentimport < ApplicationRecord
  belongs_to :user

  has_one_attached :shipmentimport
end
