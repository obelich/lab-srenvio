class ChangeColumnsIntegerToDecimalToShipments < ActiveRecord::Migration[6.0]
  def up
    change_column :parcels, :length, :decimal, precision: 5, scale: 2
    change_column :parcels, :width, :decimal, precision: 5, scale: 2
    change_column :parcels, :height, :decimal, precision: 5, scale: 2
    change_column :parcels, :weight, :decimal, precision: 5, scale: 2
  end

  def down
    change_column :parcels, :length, :integer
    change_column :parcels, :width, :integer
    change_column :parcels, :height, :integer
    change_column :parcels, :weight, :integer
  end
end
