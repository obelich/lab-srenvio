class Shipment < ApplicationRecord
  belongs_to :carrier
  has_one :parcel

  validates :tracking_number, uniqueness: true
  validates :carrier_id, :user_id, presence: true
end
