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

ActiveRecord::Schema.define(:version => 20120303211343) do

  create_table "attendances", :force => true do |t|
    t.integer  "service_id"
    t.integer  "classroom_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "children", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
    t.boolean  "inactive",     :default => false
  end

  create_table "children_parents", :id => false, :force => true do |t|
    t.integer "child_id"
    t.integer "parent_id"
  end

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "parents", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
    t.boolean  "inactive",   :default => false
    t.boolean  "onthecity"
    t.boolean  "visitor",    :default => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "services", :force => true do |t|
    t.datetime "service_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteers", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volunteers", ["email"], :name => "index_volunteers_on_email", :unique => true
  add_index "volunteers", ["reset_password_token"], :name => "index_volunteers_on_reset_password_token", :unique => true

end
