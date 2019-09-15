class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.references :carrier, null: false, foreign_key: true
      t.string :tracking_number, null: false, index: { unique: true }, :limit => 100

      t.timestamps
    end
  end
end
