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

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2023_06_08_125811) do
=======
<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2023_06_08_153645) do
=======
ActiveRecord::Schema[7.0].define(version: 2023_06_08_122653) do
>>>>>>> 35257621d716e3fc6e5e6768f7a3a76f6d188f3d
>>>>>>> 3ff40d59fb69f4faf5cad8319fc5e28c1f4fbf0e
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "card_number"
    t.string "cvc"
    t.integer "number_of_guests"
    t.bigint "user_id", null: false
    t.bigint "renting_space_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_rooms"
    t.index ["renting_space_id"], name: "index_bookings_on_renting_space_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "renting_spaces", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "amenities"
    t.boolean "internet"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
<<<<<<< HEAD
    t.string "description"
    t.integer "price"
=======
>>>>>>> 35257621d716e3fc6e5e6768f7a3a76f6d188f3d
    t.index ["user_id"], name: "index_renting_spaces_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "renting_spaces"
  add_foreign_key "bookings", "users"
  add_foreign_key "renting_spaces", "users"
end
