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

ActiveRecord::Schema.define(version: 20161218150520) do

  create_table "admins", force: :cascade do |t|
    t.integer  "kod",           limit: 4
    t.string   "firstname",     limit: 255
    t.string   "lastname",      limit: 255
    t.string   "email",         limit: 255
    t.string   "rd",            limit: 255
    t.string   "phone",         limit: 255
    t.string   "phone_home",    limit: 255
    t.string   "password_salt", limit: 255
    t.string   "password_hash", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["kod"], name: "index_admins_on_kod", using: :btree

  create_table "bookrents", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.integer  "admin_id",   limit: 4
    t.integer  "user_Id",    limit: 4
    t.date     "begin_date"
    t.date     "end_date"
    t.integer  "status",     limit: 4, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookrents", ["admin_id"], name: "index_bookrents_on_admin_id", using: :btree
  add_index "bookrents", ["book_id"], name: "index_bookrents_on_book_id", using: :btree
  add_index "bookrents", ["user_Id"], name: "index_bookrents_on_user_Id", using: :btree

  create_table "books", force: :cascade do |t|
    t.integer  "kod",        limit: 4
    t.string   "name",       limit: 255
    t.string   "ddc",        limit: 255
    t.integer  "count",      limit: 4
    t.string   "isbn",       limit: 255
    t.string   "writer",     limit: 255
    t.date     "write_date"
    t.integer  "type_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["kod"], name: "index_books_on_kod", using: :btree
  add_index "books", ["type_id"], name: "index_books_on_type_id", using: :btree

  create_table "mnes", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.boolean  "iss"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_repeat_logins", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_repeat_logins", ["user_id"], name: "index_user_repeat_logins_on_user_id", using: :btree

  create_table "usermenus", force: :cascade do |t|
    t.string   "l",          limit: 255
    t.string   "v",          limit: 255
    t.boolean  "s",                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "kod",           limit: 4
    t.string   "firstname",     limit: 255
    t.string   "lastname",      limit: 255
    t.string   "email",         limit: 255
    t.string   "rd",            limit: 255
    t.string   "phone",         limit: 255
    t.string   "phone_home",    limit: 255
    t.string   "password_salt", limit: 255
    t.string   "password_hash", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["kod"], name: "index_users_on_kod", using: :btree

end
