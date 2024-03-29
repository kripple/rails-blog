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

ActiveRecord::Schema.define(version: 20151111234844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "date",        null: false
    t.text     "description", null: false
    t.text     "body",        null: false
    t.boolean  "published"
    t.string   "slug",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "description", null: false
    t.string   "url",         null: false
    t.string   "source"
    t.boolean  "published"
    t.string   "slug",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "date",        null: false
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tag_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["slug"], name: "index_tags_on_slug", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "password_digest"
    t.text     "about",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
