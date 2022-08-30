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

ActiveRecord::Schema.define(version: 2022_08_30_124046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "running_records", force: :cascade do |t|
    t.date "date"
    t.integer "running_hour"
    t.integer "running_minute"
    t.integer "running_second"
    t.float "running_distance"
    t.float "calorie"
    t.float "vdot"
    t.integer "intensity", default: 0, null: false
    t.integer "freq", default: 1, null: false
    t.bigint "user_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_running_records_on_user_id"
  end

  create_table "training_suggestions", force: :cascade do |t|
    t.float "running_distance"
    t.integer "intensity"
    t.integer "adjust_intensity", default: 0
    t.integer "freq", default: 1, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "temperature"
    t.integer "height"
    t.index ["user_id"], name: "index_training_suggestions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "age"
    t.integer "sex", default: 0, null: false
    t.float "weight"
    t.integer "running_hour", default: 0, null: false
    t.integer "running_minute", default: 30, null: false
    t.integer "running_second", default: 0, null: false
    t.float "running_distance", default: 5.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "running_records", "users"
  add_foreign_key "training_suggestions", "users"
end
