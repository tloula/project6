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

ActiveRecord::Schema.define(version: 2020_04_17_221915) do

  create_table "catalogs", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_catalogs", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "catalog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catalog_id"], name: "index_course_catalogs_on_catalog_id"
    t.index ["course_id"], name: "index_course_catalogs_on_course_id"
  end

  create_table "course_categories", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_course_categories_on_category_id"
    t.index ["course_id"], name: "index_course_categories_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "designator"
    t.string "description"
    t.integer "credits"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "majors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plan_courses", force: :cascade do |t|
    t.integer "plan_id", null: false
    t.integer "course_id", null: false
    t.string "term"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_plan_courses_on_course_id"
    t.index ["plan_id"], name: "index_plan_courses_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "catalog_id", null: false
    t.integer "major_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catalog_id"], name: "index_plans_on_catalog_id"
    t.index ["major_id"], name: "index_plans_on_major_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "name"
    t.integer "major_id", null: false
    t.integer "catalog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catalog_id"], name: "index_requirements_on_catalog_id"
    t.index ["major_id"], name: "index_requirements_on_major_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "login"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "course_catalogs", "catalogs"
  add_foreign_key "course_catalogs", "courses"
  add_foreign_key "course_categories", "categories"
  add_foreign_key "course_categories", "courses"
  add_foreign_key "plan_courses", "courses"
  add_foreign_key "plan_courses", "plans"
  add_foreign_key "plans", "catalogs"
  add_foreign_key "plans", "majors"
  add_foreign_key "plans", "users"
  add_foreign_key "requirements", "catalogs"
  add_foreign_key "requirements", "majors"
end
