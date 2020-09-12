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

ActiveRecord::Schema.define(version: 2020_09_12_192432) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_number"
    t.string "name"
    t.integer "discipline_id", null: false
    t.string "area"
    t.float "price"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discipline_id"], name: "index_courses_on_discipline_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["description"], name: "index_disciplines_on_description", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.integer "major_id", null: false
    t.boolean "is_deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["major_id"], name: "index_students_on_major_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.integer "discipline_id", null: false
    t.boolean "is_deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discipline_id"], name: "index_teachers_on_discipline_id"
  end

  create_table "user_auths", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "authenticable_type"
    t.integer "authenticable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["authenticable_type", "authenticable_id"], name: "index_user_auths_on_authenticable_type_and_authenticable_id"
    t.index ["email"], name: "index_user_auths_on_email", unique: true
  end

  add_foreign_key "courses", "disciplines"
  add_foreign_key "students", "disciplines", column: "major_id"
  add_foreign_key "teachers", "disciplines"
end
