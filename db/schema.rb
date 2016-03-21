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

ActiveRecord::Schema.define(version: 20160320072348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "heroes", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  add_index "heroes", ["year"], name: "index_heroes_on_year", using: :btree

  create_table "nominations", force: :cascade do |t|
    t.text     "testimonial",  null: false
    t.integer  "nominator_id"
    t.integer  "nominee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nominators", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nominees", force: :cascade do |t|
    t.string  "github_username"
    t.string  "name"
    t.integer "nomination_count", default: 0
  end

  add_index "nominees", ["github_username"], name: "index_nominees_on_github_username", using: :btree

end
