class AddColumnDupShipmentsToShipmentimports < ActiveRecord::Migration[6.0]
  def change
    add_column :shipmentimports, :reject, :integer, default: 0
  end
end
