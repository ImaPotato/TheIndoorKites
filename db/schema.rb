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

ActiveRecord::Schema.define(version: 20140518032218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "company_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "connections", force: true do |t|
    t.integer  "company_id"
    t.string   "location_one"
    t.string   "location_two"
    t.decimal  "weight_cost"
    t.decimal  "volume_cost"
    t.decimal  "max_weight"
    t.decimal  "max_volume"
    t.integer  "duration"
    t.integer  "frequency"
    t.string   "priority"
    t.string   "day"
    t.boolean  "utilised"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.integer  "connection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail", force: true do |t|
    t.string   "sender"
    t.string   "receiver"
    t.string   "to"
    t.string   "from"
    t.string   "day"
    t.decimal  "weight"
    t.decimal  "volume"
    t.string   "priority"
    t.date     "send_date"
    t.date     "receive_date"
    t.date     "max_delivery_time"
    t.decimal  "cost"
    t.string   "current_location"
    t.boolean  "international"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", force: true do |t|
    t.decimal  "i_air_w_cost"
    t.decimal  "i_air_v_cost"
    t.decimal  "i_land_w_cost"
    t.decimal  "i_land_v_cost"
    t.decimal  "d_air_w_cost"
    t.decimal  "d_air_v_cost"
    t.decimal  "d_land_w_cost"
    t.decimal  "d_land_v_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "is_manager"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
