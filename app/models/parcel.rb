class Parcel < ApplicationRecord
  belongs_to :shipment
  validates :length, :width, :height, :weight, :distance_unit, :mass_unit,   presence: true
end
