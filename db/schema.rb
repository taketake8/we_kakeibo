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

ActiveRecord::Schema.define(version: 2020_05_25_115721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pay_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "color"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pay_categories_on_user_id"
  end

  create_table "pays", force: :cascade do |t|
    t.datetime "start_time"
    t.integer "price", null: false
    t.string "memo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pay_category_id"
    t.index ["pay_category_id"], name: "index_pays_on_pay_category_id"
    t.index ["user_id"], name: "index_pays_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.integer "age", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "pay_categories", "users"
  add_foreign_key "pays", "pay_categories"
  add_foreign_key "pays", "users"
end
