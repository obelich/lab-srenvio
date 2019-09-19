class CreateShipmentimports < ActiveRecord::Migration[6.0]
  def change
    create_table :shipmentimports do |t|
      t.integer :shipments, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
