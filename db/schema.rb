# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_31_063427) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "title", null: false
    t.integer "question_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_answers_on_title"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "correct_answer_id"
    t.decimal "attempt_duration", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_questions_on_title"
  end

  create_table "users", force: :cascade do |t|
    t.string "session_id", null: false
    t.string "full_name", null: false
    t.string "contact_number", null: false
    t.decimal "score", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_questions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "question", null: false
    t.integer "answer_id", null: false
    t.decimal "result", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_users_questions_on_user_id"
  end

end
