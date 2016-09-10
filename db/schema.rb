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

ActiveRecord::Schema.define(version: 20160905123722) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "first_name",      default: "",    null: false
    t.string   "last_name",       default: "",    null: false
    t.string   "role",                            null: false
    t.string   "email",                           null: false
    t.boolean  "status",          default: false
    t.string   "token",                           null: false
    t.string   "password_digest",                 null: false
    t.string   "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  create_table "breweries", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checkins", force: :cascade do |t|
    t.integer  "drinker_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["drinker_id"], name: "index_checkins_on_drinker_id"
    t.index ["restaurant_id"], name: "index_checkins_on_restaurant_id"
  end

  create_table "drinkers", force: :cascade do |t|
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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "full_name"
    t.string   "token"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_drinkers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_drinkers_on_reset_password_token", unique: true
  end

  create_table "drinkings", force: :cascade do |t|
    t.integer  "festival_id"
    t.integer  "drinker_id"
    t.integer  "restaurant_id"
    t.integer  "sake_id"
    t.integer  "sake_temperature_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["drinker_id"], name: "index_drinkings_on_drinker_id"
    t.index ["festival_id"], name: "index_drinkings_on_festival_id"
    t.index ["restaurant_id"], name: "index_drinkings_on_restaurant_id"
    t.index ["sake_id"], name: "index_drinkings_on_sake_id"
    t.index ["sake_temperature_id"], name: "index_drinkings_on_sake_temperature_id"
  end

  create_table "festivals", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_participations", force: :cascade do |t|
    t.integer  "festival_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["festival_id", "restaurant_id"], name: "unique_index_restaurant_participations", unique: true
    t.index ["festival_id"], name: "index_restaurant_participations_on_festival_id"
    t.index ["restaurant_id"], name: "index_restaurant_participations_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                                null: false
    t.decimal  "latitude",   precision: 10, scale: 7
    t.decimal  "longitude",  precision: 10, scale: 7
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "sake_menu_items", force: :cascade do |t|
    t.integer  "festival_id"
    t.integer  "restaurant_id"
    t.integer  "sake_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["festival_id", "restaurant_id", "sake_id"], name: "unique_index_sake_menu_items", unique: true
    t.index ["festival_id"], name: "index_sake_menu_items_on_festival_id"
    t.index ["restaurant_id"], name: "index_sake_menu_items_on_restaurant_id"
    t.index ["sake_id"], name: "index_sake_menu_items_on_sake_id"
  end

  create_table "sake_temperatures", force: :cascade do |t|
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "position"
    t.boolean  "enabled",    default: true, null: false
  end

  create_table "sakes", force: :cascade do |t|
    t.string   "name"
    t.integer  "brewery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brewery_id"], name: "index_sakes_on_brewery_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "drinker_id"
    t.integer  "festival_id"
    t.integer  "restaurant_id"
    t.string   "passcode"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["drinker_id"], name: "index_tickets_on_drinker_id"
    t.index ["festival_id"], name: "index_tickets_on_festival_id"
    t.index ["restaurant_id"], name: "index_tickets_on_restaurant_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "drinking_id"
    t.integer  "score",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["drinking_id"], name: "index_votes_on_drinking_id"
  end

end
