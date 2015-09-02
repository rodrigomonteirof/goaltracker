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

ActiveRecord::Schema.define(version: 20150326162844) do

  create_table "goal_frequencies", force: :cascade do |t|
    t.string  "value"
    t.integer "goal_id"
    t.string  "type"
  end

  create_table "goal_histories", force: :cascade do |t|
    t.date     "date"
    t.boolean  "response"
    t.integer  "goal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goal_history_annotations", force: :cascade do |t|
    t.text     "text"
    t.integer  "goal_history_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.time     "alarm_hour"
    t.date     "until_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.string   "password"
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
    t.string   "provider"
    t.string   "uid"
    t.string   "access_token"
    t.string   "photo_url"
  end

end
