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

ActiveRecord::Schema.define(version: 20160918081055) do

  create_table "addresses", force: :cascade do |t|
    t.string   "location"
    t.string   "province"
    t.string   "district"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "place_review_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["place_review_id"], name: "index_comments_on_place_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "description"
    t.string   "image"
    t.integer  "place_review_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["place_review_id"], name: "index_feedbacks_on_place_review_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "noti_type"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "place_reviews", force: :cascade do |t|
    t.string   "tittle"
    t.string   "description"
    t.string   "image"
    t.float    "rate"
    t.integer  "address_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["address_id"], name: "index_place_reviews_on_address_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar"
    t.integer  "gender"
    t.string   "phone"
    t.integer  "user_id"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_profiles_on_address_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.string   "tittle"
    t.string   "description"
    t.string   "image"
    t.integer  "user_id"
    t.integer  "address_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["address_id"], name: "index_suggestions_on_address_id"
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "travel_teams", force: :cascade do |t|
    t.string   "description"
    t.datetime "time_start"
    t.datetime "time_return"
    t.integer  "user_id"
    t.integer  "place_review_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["place_review_id"], name: "index_travel_teams_on_place_review_id"
    t.index ["user_id"], name: "index_travel_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
