class CreateParcels < ActiveRecord::Migration[6.0]
  def change
    create_table :parcels do |t|
      t.references :shipment, null: false, foreign_key: true
      t.integer :length, null: false
      t.integer :width, null: false
      t.integer :height, null: false
      t.integer :weight, null: false
      t.string :distance_unit, null: false
      t.string :mass_unit, null: false

      t.timestamps
    end
  end
end
