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

ActiveRecord::Schema.define(:version => 20100319050414) do

  create_table "nominations", :force => true do |t|
    t.string "nominee",         :null => false
    t.string "nominator_email", :null => false
    t.string "nominator_name",  :null => false
    t.string "site_name",       :null => false
    t.string "site_url",        :null => false
    t.text   "testimonial",     :null => false
    t.string "site_subdomain"
  end

end
