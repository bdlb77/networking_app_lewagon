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

ActiveRecord::Schema.define(version: 2018_06_12_145845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.string "company"
    t.string "username"
    t.string "email"
    t.string "phone_number"
    t.date "date_of_birth"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_contact_type"
    t.string "first_location"
    t.string "first_tag"
    t.string "second_tag"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "descussion_topics", force: :cascade do |t|
    t.string "name"
    t.bigint "tag_id"
    t.bigint "milestone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["milestone_id"], name: "index_descussion_topics_on_milestone_id"
    t.index ["tag_id"], name: "index_descussion_topics_on_tag_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "milestones", force: :cascade do |t|
    t.bigint "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_type"
    t.bigint "location_id"
    t.index ["contact_id"], name: "index_milestones_on_contact_id"
    t.index ["location_id"], name: "index_milestones_on_location_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "milestone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["milestone_id"], name: "index_subjects_on_milestone_id"
    t.index ["tag_id"], name: "index_subjects_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "descussion_topics", "milestones"
  add_foreign_key "descussion_topics", "tags"
  add_foreign_key "locations", "users"
  add_foreign_key "milestones", "contacts"
  add_foreign_key "milestones", "locations"
  add_foreign_key "subjects", "milestones"
  add_foreign_key "subjects", "tags"
  add_foreign_key "tags", "users"
end
