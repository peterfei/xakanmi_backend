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

ActiveRecord::Schema.define(version: 20141024185952) do

  create_table "admin_categories", force: true do |t|
    t.string   "name"
    t.string   "catid"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_courses", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.string   "courseid"
    t.integer  "total"
    t.string   "address"
    t.date     "coursedate"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_courses", ["category_id"], name: "index_admin_courses_on_category_id"

  create_table "admin_dashboards", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_permissions", force: true do |t|
    t.string   "code"
    t.string   "subject"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_roles", force: true do |t|
    t.string   "name"
    t.text     "permissions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_students", force: true do |t|
    t.string   "snum"
    t.string   "major"
    t.integer  "category_id"
    t.boolean  "sex"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_students", ["category_id"], name: "index_admin_students_on_category_id"
  add_index "admin_students", ["course_id"], name: "index_admin_students_on_course_id"
  add_index "admin_students", ["user_id"], name: "index_admin_students_on_user_id"

  create_table "admin_user_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.text     "permissions"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
