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

ActiveRecord::Schema.define(version: 20150301033356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characteristics", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "characteristics", ["profile_id"], name: "index_characteristics_on_profile_id", using: :btree
  add_index "characteristics", ["skill_id"], name: "index_characteristics_on_skill_id", using: :btree

  create_table "lvlups", force: :cascade do |t|
    t.string   "description"
    t.integer  "characteristic_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "lvlups", ["characteristic_id"], name: "index_lvlups_on_characteristic_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "uid"
    t.string   "nickname"
    t.string   "image"
    t.string   "url"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "characteristics", "profiles"
  add_foreign_key "characteristics", "skills"
  add_foreign_key "lvlups", "characteristics"
end
