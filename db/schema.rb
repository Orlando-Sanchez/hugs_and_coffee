# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_06_015521) do

  create_table "appreciations", force: :cascade do |t|
    t.integer "appreciation_kind", null: false
    t.string "donor_fullname", null: false
    t.string "donor_occupation", null: false
    t.text "donor_message", null: false
    t.integer "coffees_quantity"
    t.float "hug_seconds"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_appreciations_on_user_id"
  end

  create_table "monetary_accounts", force: :cascade do |t|
    t.string "entity", null: false
    t.string "account_email", null: false
    t.string "identification"
    t.string "account_kind"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_monetary_accounts_on_user_id"
  end

  create_table "multipliers", force: :cascade do |t|
    t.integer "quantity"
    t.integer "profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_multipliers_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "fullname", null: false
    t.string "occupation", null: false
    t.text "biography", null: false
    t.decimal "coffee_price", null: false
    t.string "currency_sign", null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appreciations", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "monetary_accounts", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "multipliers", "profiles", on_update: :cascade, on_delete: :cascade
  add_foreign_key "profiles", "users", on_update: :cascade, on_delete: :cascade
end
