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

ActiveRecord::Schema.define(version: 2024_10_24_012354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anomalies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "max"
    t.integer "min"
    t.datetime "abnormal_day"
    t.string "anomaly_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_anomalies_on_user_id"
  end

  create_table "demo_anomalies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "max"
    t.integer "min"
    t.datetime "abnormal_day"
    t.string "anomaly_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_demo_anomalies_on_user_id"
  end

  create_table "demo_heat_rates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "avg_heart_rate"
    t.integer "max_heart_rate"
    t.integer "min_heart_rate"
    t.date "action_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_demo_heat_rates_on_user_id"
  end

  create_table "demo_sleeps", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "sleep_time"
    t.integer "sleep_score"
    t.date "action_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_demo_sleeps_on_user_id"
  end

  create_table "user_mails", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "anomalies_id", null: false
    t.string "message", null: false
    t.datetime "sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "provider"
    t.string "access_token"
    t.string "refresh_token"
    t.datetime "expires_in"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "supabase_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "anomalies", "users"
  add_foreign_key "demo_anomalies", "users"
  add_foreign_key "demo_heat_rates", "users"
  add_foreign_key "demo_sleeps", "users"
end
