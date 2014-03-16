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

ActiveRecord::Schema.define(version: 20140316022900) do

  create_table "affiliate_settings", force: true do |t|
    t.string  "discount_type"
    t.string  "reward_type"
    t.integer "event_id"
    t.boolean "enabled"
  end

  create_table "events", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "waiver"
    t.text     "description"
    t.string   "path"
    t.boolean  "live"
    t.string   "street_address_one"
    t.string   "street_address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "timezone"
    t.date     "date"
    t.time     "time"
    t.string   "volunteer_coordinator_email"
    t.string   "support_email"
    t.text     "google_maps_iframe"
    t.text     "receipt_html"
    t.text     "race_day_info_html"
    t.text     "packet_pickup_info_html"
    t.boolean  "published"
  end

  create_table "fees", force: true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "referral_code_id"
  end

  create_table "referral_codes", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "discount_type"
    t.decimal  "amount",        precision: 8, scale: 2
    t.integer  "codeable_id"
    t.string   "codeable_type"
    t.boolean  "published"
    t.integer  "quantity"
  end

  create_table "settings", force: true do |t|
    t.string   "var",         null: false
    t.text     "value"
    t.integer  "target_id",   null: false
    t.string   "target_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["target_type", "target_id", "var"], name: "index_settings_on_target_type_and_target_id_and_var", unique: true

  create_table "teams", force: true do |t|
    t.string  "name"
    t.integer "event_id"
  end

  create_table "tickets", force: true do |t|
    t.date     "for_sale_begin"
    t.date     "for_sale_end"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",          precision: 8, scale: 2
    t.integer  "event_id"
    t.string   "ticket_type"
    t.boolean  "published"
  end

  create_table "user_events", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "waiver_signed"
  end

  create_table "user_teams", force: true do |t|
    t.integer "user_id"
    t.integer "team_id"
  end

  create_table "user_tickets", force: true do |t|
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  create_table "user_waves", force: true do |t|
    t.integer  "wave_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.time     "dob"
    t.string   "shirtsize"
    t.string   "zipcode"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "stripe_user_id"
    t.string   "stripe_publishable_key"
    t.string   "stripe_access_token"
    t.string   "subdomain"
    t.string   "type"
    t.string   "stripe_participant_id"
    t.string   "stripe_refresh_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "waves", force: true do |t|
    t.time     "start_time"
    t.integer  "quantity"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

end
