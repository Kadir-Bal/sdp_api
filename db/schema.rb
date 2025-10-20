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

ActiveRecord::Schema[8.0].define(version: 2025_10_20_181657) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.float "average_score"
    t.integer "max_score"
    t.integer "min_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_analyses_on_survey_id"
  end

  create_table "credit_transactions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "activity"
    t.integer "credits_used"
    t.integer "balance_after"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount"
    t.string "transaction_type"
    t.index ["user_id"], name: "index_credit_transactions_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "content"
    t.bigint "scale_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scale_id"], name: "index_items_on_scale_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "participant_id", null: false
    t.integer "score"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", null: false
    t.string "answer"
    t.index ["item_id"], name: "index_responses_on_item_id"
    t.index ["participant_id"], name: "index_responses_on_participant_id"
    t.index ["survey_id"], name: "index_responses_on_survey_id"
  end

  create_table "scale_versions", force: :cascade do |t|
    t.bigint "scale_id", null: false
    t.integer "version_number"
    t.text "change_log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scale_id"], name: "index_scale_versions_on_scale_id"
  end

  create_table "scales", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "doi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_scales_on_author_id"
  end

  create_table "survey_analyses", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.float "average_score"
    t.float "max_score"
    t.float "min_score"
    t.integer "total_responses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_survey_analyses_on_survey_id"
  end

  create_table "survey_assignments", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "participant_id", null: false
    t.datetime "assigned_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_survey_assignments_on_participant_id"
    t.index ["survey_id"], name: "index_survey_assignments_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.bigint "scale_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scale_id"], name: "index_surveys_on_scale_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "analyses", "surveys"
  add_foreign_key "credit_transactions", "users"
  add_foreign_key "items", "scales"
  add_foreign_key "responses", "items"
  add_foreign_key "responses", "participants"
  add_foreign_key "responses", "surveys"
  add_foreign_key "scale_versions", "scales"
  add_foreign_key "scales", "users", column: "author_id"
  add_foreign_key "survey_analyses", "surveys"
  add_foreign_key "survey_assignments", "participants"
  add_foreign_key "survey_assignments", "surveys"
  add_foreign_key "surveys", "scales"
end
