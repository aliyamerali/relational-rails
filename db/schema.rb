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

ActiveRecord::Schema.define(version: 2021_05_11_180441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bartenders", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "on_vacation"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.integer "publish_year"
    t.boolean "available"
    t.bigint "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.float "cost"
    t.string "name"
    t.integer "abv"
    t.boolean "popular"
    t.bigint "bartender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bartender_id"], name: "index_drinks_on_bartender_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.integer "staff_count"
    t.integer "member_count"
    t.boolean "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "libraries"
  add_foreign_key "drinks", "bartenders"
end
