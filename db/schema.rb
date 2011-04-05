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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110405201817) do

  create_table "heroes", :force => true do |t|
    t.string   "name"
    t.string   "avatar"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "nominations", :force => true do |t|
    t.integer "nominee_id",   :limit => 8, :null => false
    t.text    "testimonial",               :null => false
    t.integer "nominator_id"
  end

  create_table "nominators", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nominees", :force => true do |t|
    t.string "github_username"
    t.string "name"
  end

  create_table "sites", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nominations_count"
  end

  add_index "sites", ["url"], :name => "index_sites_on_url"

end
