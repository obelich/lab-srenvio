# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_15_035622) do

  create_table "carriers", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_carriers_on_name", unique: true
  end

  create_table "parcels", force: :cascade do |t|
    t.integer "shipments_id", null: false
    t.integer "length", null: false
    t.integer "width", null: false
    t.integer "height", null: false
    t.integer "weight", null: false
    t.string "distance_unit", null: false
    t.string "mass_unit", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipments_id"], name: "index_parcels_on_shipments_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.integer "carriers_id", null: false
    t.string "tracking_number", limit: 100, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carriers_id"], name: "index_shipments_on_carriers_id"
    t.index ["tracking_number"], name: "index_shipments_on_tracking_number", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "parcels", "shipments", column: "shipments_id"
  add_foreign_key "shipments", "carriers", column: "carriers_id"
end
