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

ActiveRecord::Schema.define(version: 20140512013614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "to"
    t.string   "from"
    t.string   "weight"
    t.decimal  "weight_cost"
    t.decimal  "volume_cost"
    t.decimal  "max_weight"
    t.integer  "max_volume"
    t.time     "duration"
    t.integer  "frequency"
    t.string   "day"
    t.string   "utilized"
    t.integer  "connection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_histories", force: true do |t|
    t.string   "action"
    t.datetime "date"
    t.string   "user"
    t.integer  "connection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail", force: true do |t|
    t.string   "day"
    t.string   "to"
    t.string   "from"
    t.decimal  "weight"
    t.integer  "volume"
    t.string   "priority"
    t.datetime "send_date"
    t.datetime "receive_date"
    t.time     "max_delivery_time"
    t.decimal  "cost"
    t.integer  "tracking_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_histories", force: true do |t|
    t.string   "action"
    t.datetime "date"
    t.string   "location"
    t.string   "user"
    t.integer  "tracking_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", force: true do |t|
    t.decimal  "i_air_weight_cost"
    t.decimal  "i_air_volume_cost"
    t.decimal  "i_land_weight_cost"
    t.decimal  "i_land_volume_cost"
    t.decimal  "d_air_weight_cost"
    t.decimal  "d_air_volume_cost"
    t.decimal  "d_land_weight_cost"
    t.decimal  "d_land_volume_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
