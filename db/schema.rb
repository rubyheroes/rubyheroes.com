# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 14) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", :force => true do |t|
    t.string   "site_url"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mugshots", :force => true do |t|
    t.integer "parent_id"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
  end

  create_table "nominations", :force => true do |t|
    t.string "nominee",         :null => false
    t.string "nominator_email", :null => false
    t.string "nominator_name",  :null => false
    t.string "site_name",       :null => false
    t.string "site_url",        :null => false
    t.text   "testimonial",     :null => false
    t.string "site_subdomain"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.binary  "server_url"
    t.string  "handle"
    t.binary  "secret"
    t.integer "issued"
    t.integer "lifetime"
    t.string  "assoc_type"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "openid_url"
    t.string   "name"
    t.integer  "mugshot_id"
  end

  create_table "votes", :force => true do |t|
    t.integer "category_id",   :null => false
    t.integer "nomination_id", :null => false
    t.integer "user_id",       :null => false
  end

end
