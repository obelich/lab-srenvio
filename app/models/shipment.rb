class Shipment < ApplicationRecord
  belongs_to :user
  belongs_to :carrier
  has_one :parcel, dependent: :destroy

  validates :tracking_number, uniqueness: true
  validates :carrier_id, :user_id, presence: true


  accepts_nested_attributes_for :parcel, allow_destroy: true, reject_if: proc { |attr| attr['length'].blank? }



  def self.gen_tracking_number
    loop do
      tracking_number = SecureRandom.random_number(999999999999999)
      break tracking_number unless Shipment.where(tracking_number: tracking_number).exists?
    end
  end


end
