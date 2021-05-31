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

ActiveRecord::Schema.define(version: 2021_05_30_074205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "check_ins", force: :cascade do |t|
    t.bigint "seat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.integer "event_id"
    t.index ["event_id"], name: "index_check_ins_on_event_id"
    t.index ["seat_id"], name: "index_check_ins_on_seat_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "tel"
    t.string "event"
    t.string "title"
    t.text "feedback"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "location"
    t.string "address"
    t.string "s_year"
    t.string "s_month"
    t.string "s_date"
    t.string "s_time"
    t.string "e_year"
    t.string "e_month"
    t.string "e_date"
    t.string "e_time"
    t.string "city"
    t.bigint "organization_id"
    t.string "image"
    t.datetime "start_time"
    t.datetime "end_time"
    t.index ["organization_id"], name: "index_events_on_organization_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "seat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["seat_id"], name: "index_line_items_on_seat_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "seat_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantity", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["seat_id"], name: "index_order_items_on_seat_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "serial"
    t.string "receiver"
    t.string "tel"
    t.string "status"
    t.bigint "user_id", null: false
    t.integer "totalAmount"
    t.string "checkMacValue"
    t.text "item_list"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "deleted_at"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "domain_name"
    t.string "slug"
    t.string "image"
    t.string "facebook"
    t.string "twitter"
    t.string "flickr"
    t.string "e_mail"
    t.string "web"
    t.index ["deleted_at"], name: "index_organizations_on_deleted_at"
    t.index ["slug"], name: "index_organizations_on_slug", unique: true
  end

  create_table "seats", force: :cascade do |t|
    t.string "area"
    t.string "status"
    t.bigint "ticket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_id"], name: "index_seats_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "amount"
    t.string "status"
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.string "name"
    t.string "tel"
    t.string "status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "users"
  add_foreign_key "check_ins", "seats"
  add_foreign_key "contacts", "users"
  add_foreign_key "events", "organizations"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "seats"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "seats"
  add_foreign_key "orders", "users"
  add_foreign_key "seats", "tickets"
  add_foreign_key "tickets", "events"
end
