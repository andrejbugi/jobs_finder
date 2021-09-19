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

ActiveRecord::Schema.define(version: 2021_09_19_112429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_applications", id: :string, limit: 36, force: :cascade do |t|
    t.string "full_name", limit: 128, null: false
    t.string "phone_number", limit: 16, null: false
    t.string "address", limit: 128, null: false
    t.string "email", limit: 64, null: false
    t.integer "education", null: false
    t.datetime "date_of_birth", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "job_id", limit: 36, null: false
    t.index ["job_id"], name: "index_job_applications_on_job_id"
  end

  create_table "jobs", id: :string, limit: 36, force: :cascade do |t|
    t.string "title", limit: 128, null: false
    t.string "description", limit: 2024, null: false
    t.string "company_name", limit: 64, null: false
    t.string "company_email", limit: 64, null: false
    t.string "category", limit: 64, null: false
    t.integer "status", default: 1, null: false
    t.datetime "deadline", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "job_applications", "jobs"
end
