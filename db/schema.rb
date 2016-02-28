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

ActiveRecord::Schema.define(version: 20160228180036) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "extra_expenditures", force: :cascade do |t|
    t.float    "payment"
    t.string   "expenditure_type"
    t.integer  "user_id"
    t.text     "reason"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "edit_request",       default: false
    t.boolean  "edit_able",          default: false
    t.integer  "extra_type"
    t.string   "other_reason"
  end

  add_index "extra_expenditures", ["user_id"], name: "index_extra_expenditures_on_user_id"

  create_table "food_expenditures", force: :cascade do |t|
    t.integer  "food_type"
    t.string   "expenditure_type"
    t.string   "hotel_name"
    t.float    "payment"
    t.integer  "no_of_persons"
    t.text     "comments"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "edit_request",       default: false
    t.boolean  "edit_able",          default: false
    t.string   "voucher_reference"
    t.string   "guest_name"
    t.string   "on_request_of"
  end

  add_index "food_expenditures", ["user_id"], name: "index_food_expenditures_on_user_id"

  create_table "hotel_expenditures", force: :cascade do |t|
    t.string   "expenditure_type"
    t.datetime "checked_in_date"
    t.datetime "checked_out_date"
    t.integer  "total_days"
    t.integer  "charges_per_day"
    t.integer  "no_of_rooms"
    t.integer  "room_type"
    t.float    "total_amount"
    t.string   "hotel_name"
    t.integer  "user_id"
    t.text     "comments"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "edit_request",       default: false
    t.boolean  "edit_able",          default: false
    t.string   "voucher_reference"
    t.string   "guest_name"
    t.string   "supplier_name"
    t.integer  "room_basis"
    t.integer  "no_of_persons"
    t.integer  "adults"
    t.integer  "children"
  end

  add_index "hotel_expenditures", ["user_id"], name: "index_hotel_expenditures_on_user_id"

  create_table "transport_expenditures", force: :cascade do |t|
    t.integer  "transport_type"
    t.string   "expenditure_type"
    t.integer  "no_of_seats"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "arrival_place"
    t.string   "departure_place"
    t.float    "payment"
    t.text     "comments"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "edit_request",       default: false
    t.boolean  "edit_able",          default: false
    t.string   "voucher_reference"
    t.string   "guest_name"
    t.string   "supplier_name"
  end

  add_index "transport_expenditures", ["user_id"], name: "index_transport_expenditures_on_user_id"

  create_table "user_balances", force: :cascade do |t|
    t.float    "amount"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "comments"
  end

  add_index "user_balances", ["user_id"], name: "index_user_balances_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.integer  "total_amount",              default: 0
    t.integer  "current_amount",            default: 0
    t.integer  "total_expenditures_amount", default: 0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "role"
    t.integer  "balance_request"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
