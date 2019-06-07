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

ActiveRecord::Schema.define(version: 2019_06_07_172312) do

  create_table "pools", force: :cascade do |t|
    t.string "pool_desc"
    t.integer "user_id"
    t.string "pool_name"
    t.string "building_name"
    t.string "address"
    t.datetime "pool_open"
    t.datetime "pool_close"
    t.boolean "has_happy_hour"
    t.datetime "hh_open"
    t.datetime "hh_close"
    t.boolean "has_food"
    t.string "website"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
  end

end
