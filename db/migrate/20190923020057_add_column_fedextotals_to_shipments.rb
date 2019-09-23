class AddColumnFedextotalsToShipments < ActiveRecord::Migration[6.0]
  def change
    add_column :shipments, :total_base_charge, :decimal, precision: 5, scale: 2, default: 0.00
    add_column :shipments, :total_surcharges, :decimal, precision: 5, scale: 2, default: 0.00
    add_column :shipments, :total_net_charge, :decimal, precision: 5, scale: 2, default: 0.00
  end
end
