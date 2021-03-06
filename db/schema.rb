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

ActiveRecord::Schema.define(version: 20170413132633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goods", force: :cascade do |t|
    t.string   "name",                                   default: "",    null: false
    t.decimal  "value",         precision: 12, scale: 2, default: "0.0", null: false
    t.integer  "individual_id",                                          null: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "category",                               default: "",    null: false
  end

  create_table "individuals", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name",                   default: "",      null: false
    t.string   "address",                default: "",      null: false
    t.string   "city",                   default: "",      null: false
    t.integer  "gender",                                   null: false
    t.integer  "age",                                      null: false
    t.boolean  "auditor",                default: false
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_individuals_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_individuals_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_individuals_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_individuals_on_uid_and_provider", unique: true, using: :btree
  end

end
