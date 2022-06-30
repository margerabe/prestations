# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_30_181104) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "starts_at"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opening_hours", force: :cascade do |t|
    t.string "day"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prestations", force: :cascade do |t|
    t.string "reference"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prestations_pros", id: false, force: :cascade do |t|
    t.bigint "pro_id", null: false
    t.bigint "prestation_id", null: false
    t.index ["prestation_id"], name: "index_prestations_pros_on_prestation_id"
    t.index ["pro_id"], name: "index_prestations_pros_on_pro_id"
  end

  create_table "pros", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.integer "max_kilometers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
