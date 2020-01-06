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

ActiveRecord::Schema.define(version: 2020_01_06_101718) do

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

  create_table "commodities", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "commodity_name", null: false
    t.string "comment"
    t.string "commodity_image_id"
    t.integer "regular_price", null: false
    t.integer "sale_price", null: false
    t.integer "quantity", null: false
    t.datetime "limit", null: false
    t.integer "commodity_category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "company_name", null: false
    t.string "phone", null: false
    t.string "postalcode", null: false
    t.string "address", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_companies_on_address"
    t.index ["company_name"], name: "index_companies_on_company_name"
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "cooks", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "process_count", null: false
    t.string "process_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infos", force: :cascade do |t|
    t.integer "user_status", null: false
    t.integer "public_id"
    t.integer "company_id"
    t.string "contributor", null: false
    t.string "contributor_email", null: false
    t.text "info_content", null: false
    t.integer "info_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.string "ingredient_name", null: false
    t.string "ingredient_amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publics", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "lastname", null: false
    t.string "firstname", null: false
    t.string "lastname_kana", null: false
    t.string "firstname_kana", null: false
    t.string "phone", null: false
    t.string "profile_image_id"
    t.string "postalcode", null: false
    t.string "address", null: false
    t.string "nickname", null: false
    t.integer "profit_price"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_publics_on_email", unique: true
    t.index ["firstname"], name: "index_publics_on_firstname"
    t.index ["firstname_kana"], name: "index_publics_on_firstname_kana"
    t.index ["lastname"], name: "index_publics_on_lastname"
    t.index ["lastname_kana"], name: "index_publics_on_lastname_kana"
    t.index ["reset_password_token"], name: "index_publics_on_reset_password_token", unique: true
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "public_id", null: false
    t.string "dish_name", null: false
    t.string "comment"
    t.string "recipe_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_name"], name: "index_recipes_on_dish_name"
  end

  create_table "reserves", force: :cascade do |t|
    t.integer "commodity_id", null: false
    t.integer "public_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
