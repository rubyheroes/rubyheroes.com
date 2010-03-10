# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 13) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "lock_version", :default => 0, :null => false
  end

  create_table "mugshots", :force => true do |t|
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "lock_version", :default => 0, :null => false
  end

  add_index "mugshots", ["parent_id"], :name => "parent_id"

  create_table "nominations", :force => true do |t|
    t.string   "nominee",                        :null => false
    t.string   "nominator_email",                :null => false
    t.string   "nominator_name",                 :null => false
    t.string   "site_name",                      :null => false
    t.string   "site_url",                       :null => false
    t.text     "testimonial",                    :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "lock_version",    :default => 0, :null => false
    t.string   "site_subdomain",                 :null => false
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.binary   "server_url"
    t.string   "handle"
    t.binary   "secret"
    t.integer  "issued"
    t.integer  "lifetime"
    t.string   "assoc_type"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "lock_version", :default => 0, :null => false
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer  "timestamp",                   :null => false
    t.string   "server_url"
    t.string   "salt",                        :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "lock_version", :default => 0, :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id",                  :null => false
    t.text     "data"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "lock_version", :default => 0, :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "lock_version", :default => 0, :null => false
    t.string   "openid_url",                  :null => false
    t.string   "name",                        :null => false
    t.integer  "mugshot_id",                  :null => false
  end

  add_index "users", ["mugshot_id"], :name => "mugshot_id"

  create_table "votes", :force => true do |t|
    t.integer  "category_id",                  :null => false
    t.integer  "nomination_id",                :null => false
    t.integer  "user_id",                      :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "lock_version",  :default => 0, :null => false
  end

  add_index "votes", ["category_id"], :name => "category_id"
  add_index "votes", ["nomination_id"], :name => "nomination_id"
  add_index "votes", ["user_id"], :name => "user_id"

  # add_foreign_key "mugshots", ["parent_id"], "mugshots", ["id"], :name => "mugshots_ibfk_1"
  # 
  # add_foreign_key "users", ["mugshot_id"], "mugshots", ["id"], :name => "users_ibfk_1"
  # 
  # add_foreign_key "votes", ["category_id"], "categories", ["id"], :name => "votes_ibfk_1"
  # add_foreign_key "votes", ["nomination_id"], "nominations", ["id"], :name => "votes_ibfk_2"
  # add_foreign_key "votes", ["user_id"], "users", ["id"], :name => "votes_ibfk_3"

end
