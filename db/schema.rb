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

ActiveRecord::Schema.define(version: 20211227114337) do

  create_table "attendance_change_approval_logs", force: :cascade do |t|
    t.date "worked_on", null: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "renewed_started_at", null: false
    t.datetime "renewed_finished_at", null: false
    t.integer "user_id", null: false
    t.integer "approval_user_id", null: false
    t.date "approval_date", null: false
    t.datetime "frequent_changes_of_started_at"
    t.datetime "frequent_changes_of_finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approval_user_id"], name: "index_attendance_change_approval_logs_on_approval_user_id"
    t.index ["user_id"], name: "index_attendance_change_approval_logs_on_user_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "note"
    t.boolean "next_day_check"
    t.integer "user_id", null: false
    t.string "contents"
    t.integer "select_superior_id"
    t.integer "superior_state"
    t.boolean "modification"
    t.integer "one_month_superior_id"
    t.integer "one_month_status"
    t.date "apply_one_month"
    t.datetime "finish_time"
    t.boolean "tomorrow"
    t.datetime "renewed_started_at"
    t.datetime "renewed_finished_at"
    t.datetime "frequent_changes_of_started_at"
    t.datetime "frequent_changes_of_finished_at"
    t.boolean "change_shift"
    t.boolean "change_month"
    t.string "description"
    t.integer "attendance_state"
    t.integer "superior_choice_id"
    t.string "one_month_superior_status"
    t.string "overwork_superior_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["one_month_superior_id"], name: "index_attendances_on_one_month_superior_id"
    t.index ["select_superior_id"], name: "index_attendances_on_select_superior_id"
    t.index ["superior_choice_id"], name: "index_attendances_on_superior_choice_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "bases", force: :cascade do |t|
    t.integer "base_number"
    t.string "base_name"
    t.string "base_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false, null: false
    t.string "department"
    t.datetime "basic_time", default: "2022-01-25 23:00:00", null: false
    t.datetime "work_time", default: "2022-01-25 22:30:00", null: false
    t.boolean "superior", default: false, null: false
    t.datetime "designated_work_start_time", default: "2022-01-26 00:00:00", null: false
    t.datetime "designated_work_end_time", default: "2022-01-26 09:00:00", null: false
    t.datetime "finish_time"
    t.string "affiliation"
    t.integer "employee_number"
    t.string "uid"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
