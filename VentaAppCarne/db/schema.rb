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

ActiveRecord::Schema.define(version: 2020_08_05_231659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "client_searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "name_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directions", force: :cascade do |t|
    t.string "sector"
    t.string "street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.string "comuna"
    t.index ["client_id"], name: "index_directions_on_client_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "unit_price"
    t.string "unit_metric"
    t.integer "supp_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "estimated_weight"
  end

  create_table "sale_periods", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_products", force: :cascade do |t|
    t.integer "cantidad"
    t.bigint "sale_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "real_weight"
    t.index ["product_id"], name: "index_sale_products_on_product_id"
    t.index ["sale_id"], name: "index_sale_products_on_sale_id"
  end

  create_table "sale_states", force: :cascade do |t|
    t.bigint "sale_id"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id"], name: "index_sale_states_on_sale_id"
    t.index ["state_id"], name: "index_sale_states_on_state_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.integer "paid"
    t.index ["client_id"], name: "index_sales_on_client_id"
  end

  create_table "searches", force: :cascade do |t|
    t.integer "client_id"
    t.datetime "updated_open"
    t.datetime "updated_close"
    t.string "products"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "order"
    t.string "states", default: [], null: false, array: true
    t.integer "total_min"
    t.integer "total_max"
    t.string "sector"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "directions", "clients"
  add_foreign_key "sale_products", "products"
  add_foreign_key "sale_products", "sales"
  add_foreign_key "sale_states", "sales"
  add_foreign_key "sale_states", "states"
  add_foreign_key "sales", "clients"
end
