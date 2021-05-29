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

ActiveRecord::Schema.define(version: 2021_05_27_104846) do

  create_table "daily_report_comments", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "daily_report_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_reports", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "facility_id", null: false
    t.string "title", null: false
    t.datetime "time", null: false
    t.string "person", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "company_name", null: false
    t.integer "company_code", null: false
    t.string "name", null: false
    t.boolean "is_deleted", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "facilities", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.string "name", null: false
    t.string "responsible_person", null: false
    t.boolean "is_closed", default: false, null: false
    t.integer "genre", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "postcode"
    t.string "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "daily_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_comments", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "item_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "facility_id", null: false
    t.string "title", null: false
    t.boolean "genre", null: false
    t.integer "status", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "employee_id"
    t.integer "receive_employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_messages_on_employee_id"
    t.index ["receive_employee_id"], name: "index_messages_on_receive_employee_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id", null: false
    t.integer "visited_id", null: false
    t.integer "daily_report_id"
    t.integer "item_id"
    t.integer "daily_report_comment_id"
    t.integer "item_comment_id"
    t.integer "message_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_report_comment_id"], name: "index_notifications_on_daily_report_comment_id"
    t.index ["daily_report_id"], name: "index_notifications_on_daily_report_id"
    t.index ["item_comment_id"], name: "index_notifications_on_item_comment_id"
    t.index ["item_id"], name: "index_notifications_on_item_id"
    t.index ["message_id"], name: "index_notifications_on_message_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

end
