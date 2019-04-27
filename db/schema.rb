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

ActiveRecord::Schema.define(version: 20190427001352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "horse1_id"
    t.integer  "horse2_id"
    t.integer  "horse3_id"
    t.integer  "practice_id"
    t.string   "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "assignments", ["practice_id"], name: "index_assignments_on_practice_id", using: :btree

  create_table "horses", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.text     "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "practices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.time     "time"
    t.datetime "date"
    t.string   "summary"
  end

  add_index "practices", ["assignment_id"], name: "index_practices_on_assignment_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "password_digest"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_foreign_key "assignments", "users"
  add_foreign_key "practices", "users"
end
