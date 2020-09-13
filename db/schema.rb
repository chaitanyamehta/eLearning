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

ActiveRecord::Schema.define(version: 2020_09_13_065322) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "section_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["section_id"], name: "index_cart_items_on_section_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_carts_on_student_id"
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

  create_table "credit_cards", force: :cascade do |t|
    t.string "name_on_card"
    t.integer "card_number"
    t.date "expiration_date"
    t.integer "cvv"
    t.integer "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_credit_cards_on_student_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["description"], name: "index_disciplines_on_description", unique: true
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "description"
    t.integer "section_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["section_id"], name: "index_feedbacks_on_section_id"
    t.index ["student_id"], name: "index_feedbacks_on_student_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "section_id", null: false
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["section_id"], name: "index_purchases_on_section_id"
    t.index ["student_id"], name: "index_purchases_on_student_id"
  end

  create_table "sections", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_sections_on_course_id"
    t.index ["teacher_id"], name: "index_sections_on_teacher_id"
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

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "sections"
  add_foreign_key "carts", "students"
  add_foreign_key "courses", "disciplines"
  add_foreign_key "credit_cards", "students"
  add_foreign_key "feedbacks", "sections"
  add_foreign_key "feedbacks", "students"
  add_foreign_key "purchases", "sections"
  add_foreign_key "purchases", "students"
  add_foreign_key "sections", "courses"
  add_foreign_key "sections", "teachers"
  add_foreign_key "students", "disciplines", column: "major_id"
  add_foreign_key "teachers", "disciplines"
end
