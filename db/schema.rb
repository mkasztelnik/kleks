# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150228184244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address",    null: false
    t.string   "city",       null: false
    t.string   "country",    null: false
    t.string   "state"
    t.string   "postcode",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conferences", force: :cascade do |t|
    t.text     "title",             null: false
    t.string   "country",           null: false
    t.string   "conference_name",   null: false
    t.string   "presentation_type", null: false
    t.integer  "year",              null: false
    t.integer  "user_id",           null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "education_type",  null: false
    t.date     "start_date",      null: false
    t.date     "end_date",        null: false
    t.string   "university_name", null: false
    t.string   "program_name",    null: false
    t.string   "country",         null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "understanding_level",                 null: false
    t.string   "speaking_level",                      null: false
    t.string   "writing_level",                       null: false
    t.boolean  "native",              default: false
    t.boolean  "study",               default: false
    t.string   "study_program"
    t.string   "study_url"
    t.boolean  "certificate"
    t.string   "certificate_name"
    t.integer  "certificate_year"
    t.string   "certificate_score"
    t.boolean  "other"
    t.text     "other_description"
    t.integer  "user_id",                             null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "motivations", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "others", force: :cascade do |t|
    t.text     "title",      null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presentations", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "abstract",   null: false
    t.string   "keywords",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "middle_name"
    t.date     "date_of_birth",                           null: false
    t.string   "place_of_birth",                          null: false
    t.string   "citizenship",                             null: false
    t.string   "country",                                 null: false
    t.boolean  "need_visa",               default: false
    t.string   "passport_number",                         null: false
    t.date     "passport_date_of_issue",                  null: false
    t.string   "passport_place_of_issue",                 null: false
    t.string   "passport_issuing_agency",                 null: false
    t.integer  "user_id",                                 null: false
    t.integer  "address_id",                              null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "publications", force: :cascade do |t|
    t.text     "title"
    t.text     "publication_title", null: false
    t.string   "authors",           null: false
    t.integer  "year",              null: false
    t.string   "language"
    t.string   "publisher"
    t.integer  "user_id",           null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.string   "institution",       null: false
    t.text     "gained_experience", null: false
    t.date     "start_date",        null: false
    t.date     "end_date",          null: false
    t.string   "country",           null: false
    t.integer  "user_id",           null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "image"
    t.boolean  "submitted",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "works", force: :cascade do |t|
    t.string   "institution",    null: false
    t.text     "responsibility", null: false
    t.string   "country",        null: false
    t.date     "start_date",     null: false
    t.date     "end_date"
    t.integer  "user_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "conferences", "users"
  add_foreign_key "educations", "users"
  add_foreign_key "educations", "users"
  add_foreign_key "languages", "users"
  add_foreign_key "motivations", "users"
  add_foreign_key "motivations", "users"
  add_foreign_key "others", "users"
  add_foreign_key "profiles", "addresses"
  add_foreign_key "profiles", "users"
  add_foreign_key "publications", "users"
  add_foreign_key "trainings", "users"
end
