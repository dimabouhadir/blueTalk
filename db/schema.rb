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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20171210122927) do
=======
ActiveRecord::Schema.define(version: 20171210121154) do
>>>>>>> 6aa0671fbe47f62f0c66cfa166707f66a1047583

  create_table "Channels", force: :cascade do |t|
    t.string "name"
    t.integer "piconet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "source"
    t.integer "destination"
    t.integer "piconet_id"
    t.boolean "received"
    t.boolean "to_from_master"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "piconets", force: :cascade do |t|
    t.integer "channel_id"
    t.integer "master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_users"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "piconet_id", default: 0
  end

end
