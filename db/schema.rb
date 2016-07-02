# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160701234145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "room_trips", force: :cascade do |t|
    t.integer "room_id"
    t.integer "trip_id"
  end

  add_index "room_trips", ["room_id"], name: "index_room_trips_on_room_id", using: :btree
  add_index "room_trips", ["trip_id"], name: "index_room_trips_on_trip_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.integer  "capacity"
    t.string   "description"
    t.string   "location"
    t.string   "number"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string   "destination"
    t.string   "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "room_trips", "rooms"
  add_foreign_key "room_trips", "trips"
end
