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

ActiveRecord::Schema.define(version: 20150610072151) do

  create_table "properties", force: :cascade do |t|
    t.string  "name",       limit: 255, null: false
    t.integer "rooms",      limit: 4,   null: false
    t.string  "facilities", limit: 255, null: false
    t.string  "category",   limit: 255, null: false
    t.integer "rating",     limit: 4,   null: false
    t.string  "address",    limit: 255, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "property_id", limit: 4, null: false
    t.datetime "from",                  null: false
    t.datetime "to",                    null: false
    t.integer  "user_id",     limit: 4, null: false
  end

  add_index "reservations", ["property_id"], name: "index_reservations_on_property_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "email",      limit: 255, null: false
    t.string "first_name", limit: 255, null: false
    t.string "last_name",  limit: 255, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
