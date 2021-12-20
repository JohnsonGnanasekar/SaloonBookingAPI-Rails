# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_08_131240) do

  create_table "booking_slots", force: :cascade do |t|
    t.integer "booking_id", null: false
    t.integer "schedule_slot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "saloon_id", null: false
    t.integer "chair_id", null: false
    t.integer "service_id", null: false
    t.date "date", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.decimal "cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chairs", force: :cascade do |t|
    t.integer "saloon_id", null: false
    t.integer "saloon_chair_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saloon_id", "saloon_chair_id"], name: "index_chairs_on_saloon_id_and_saloon_chair_id", unique: true
  end

  create_table "saloons", force: :cascade do |t|
    t.string "name", null: false
    t.string "gstin"
    t.string "pan"
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_slots", force: :cascade do |t|
    t.integer "schedule_id", null: false
    t.integer "slot_id", null: false
    t.integer "chair_id", null: false
    t.integer "book_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "saloon_id", null: false
    t.integer "week_day", null: false
    t.time "open_time", null: false
    t.time "close_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saloon_id", "week_day"], name: "index_schedules_on_saloon_id_and_week_day", unique: true
  end

  create_table "services", force: :cascade do |t|
    t.integer "saloon_id", null: false
    t.string "name", null: false
    t.integer "duration", null: false
    t.decimal "cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", force: :cascade do |t|
    t.integer "schedule_id", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
