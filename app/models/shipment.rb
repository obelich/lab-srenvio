class Shipment < ApplicationRecord
  belongs_to :carrier
  has_one :parcel, dependent: :destroy

  validates :tracking_number, uniqueness: true
  validates :carrier_id, :user_id, presence: true



  accepts_nested_attributes_for :parcel, allow_destroy: true, reject_if: proc { |attr| attr['length'].blank? }
end
