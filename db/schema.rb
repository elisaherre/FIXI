# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_04_193952) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "request_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_chatrooms_on_request_id"
  end

  create_table "fixer_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "fixer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_fixer_categories_on_category_id"
    t.index ["fixer_id"], name: "index_fixer_categories_on_fixer_id"
  end

  create_table "fixer_reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "fixer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fixer_id"], name: "index_fixer_reviews_on_fixer_id"
    t.index ["user_id"], name: "index_fixer_reviews_on_user_id"
  end

  create_table "fixers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "address"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_fixers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_fixers_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chatroom_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "request_id", null: false
    t.float "amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_payments_on_request_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "fixer_id", null: false
    t.string "status"
    t.float "budget"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fixer_id"], name: "index_requests_on_fixer_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "user_reviews", force: :cascade do |t|
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "fixer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fixer_id"], name: "index_user_reviews_on_fixer_id"
    t.index ["user_id"], name: "index_user_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chatrooms", "requests"
  add_foreign_key "fixer_categories", "categories"
  add_foreign_key "fixer_categories", "fixers"
  add_foreign_key "fixer_reviews", "fixers"
  add_foreign_key "fixer_reviews", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "payments", "requests"
  add_foreign_key "requests", "fixers"
  add_foreign_key "requests", "users"
  add_foreign_key "user_reviews", "fixers"
  add_foreign_key "user_reviews", "users"
end
