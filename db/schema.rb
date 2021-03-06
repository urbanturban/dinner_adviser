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

ActiveRecord::Schema.define(version: 20141030080346) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name", "type", "user_id"], name: "index_categories_on_name_and_type_and_user_id", unique: true
  add_index "categories", ["user_id"], name: "index_categories_on_user_id"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.boolean  "common"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "courses", ["name", "user_id"], name: "index_courses_on_name_and_user_id", unique: true
  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "courses_menus", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "menu_id"
  end

  create_table "ingridients", force: true do |t|
    t.integer  "course_id"
    t.integer  "product_id"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.date     "date"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "menus", ["user_id"], name: "index_menus_on_user_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.boolean  "common"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "available",   default: false, null: false
    t.integer  "category_id"
  end

  add_index "products", ["name", "user_id"], name: "index_products_on_name_and_user_id", unique: true
  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "products_shopping_lists", id: false, force: true do |t|
    t.integer "product_id"
    t.integer "shopping_list_id"
  end

  add_index "products_shopping_lists", ["product_id"], name: "index_products_shopping_lists_on_product_id"
  add_index "products_shopping_lists", ["shopping_list_id"], name: "index_products_shopping_lists_on_shopping_list_id"

  create_table "shopping_lists", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shopping_lists", ["user_id", "name"], name: "index_shopping_lists_on_user_id_and_name"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "role"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
