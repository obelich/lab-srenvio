class CreateCarriers < ActiveRecord::Migration[6.0]
  def change
    create_table :carriers do |t|
      t.string :name, null: false, index: { unique: true }, :limit => 100
      t.text :description

      t.timestamps
    end
  end
end
