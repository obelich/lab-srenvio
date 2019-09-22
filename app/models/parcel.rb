class Parcel < ApplicationRecord
  belongs_to :shipment
  validates :length, :width, :height, :weight, :distance_unit, :mass_unit,   presence: true
  before_save :volumetric

  def volumetric
    original_volume = self.length.to_f * self.height.to_f * self.width.to_f

    self.volumenweight = 0.5 * ((original_volume / 5000).ceil / 0.5 )
  end
end
