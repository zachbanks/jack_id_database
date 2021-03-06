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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120819235610) do

  create_table "admins", :force => true do |t|
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "auth_token"
    t.string   "email"
    t.string   "name"
  end

  create_table "buildings", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jack_ids", :force => true do |t|
    t.integer  "location_id"
    t.string   "label"
    t.string   "connections"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "jack_ids", ["location_id"], :name => "index_jack_ids_on_location_id"

  create_table "locations", :force => true do |t|
    t.integer  "building_id"
    t.string   "room"
    t.text     "notes"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.datetime "last_modified_at"
    t.string   "name_of_last_to_modify"
    t.string   "email_of_last_to_modify"
  end

  add_index "locations", ["building_id"], :name => "index_locations_on_building_id"

  create_table "pg_search_documents", :force => true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
