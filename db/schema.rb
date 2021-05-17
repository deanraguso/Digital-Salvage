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

ActiveRecord::Schema.define(version: 2021_05_16_084817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.integer "postal_code"
    t.string "street_address"
    t.string "premise"
    t.string "sub_premise"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inboxes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inboxes_messages", id: false, force: :cascade do |t|
    t.bigint "inbox_id", null: false
    t.bigint "message_id", null: false
    t.index ["inbox_id"], name: "index_inboxes_messages_on_inbox_id"
    t.index ["message_id"], name: "index_inboxes_messages_on_message_id"
  end

  create_table "inboxes_users", id: false, force: :cascade do |t|
    t.bigint "inbox_id", null: false
    t.bigint "user_id", null: false
    t.index ["inbox_id"], name: "index_inboxes_users_on_inbox_id"
    t.index ["user_id"], name: "index_inboxes_users_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.decimal "price"
    t.string "condition"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "part_type"
    t.string "image"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "inbox_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inbox_id"], name: "index_messages_on_inbox_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "item_id"
    t.integer "buyer_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "inboxes"
  add_foreign_key "messages", "users"
end
