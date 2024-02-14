# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_25_211040) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.bigint "space_id"
    t.string "username"
    t.string "color"
    t.string "profile_picture"
    t.string "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_members_on_space_id"
  end

  create_table "space_members", force: :cascade do |t|
    t.bigint "space_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_space_members_on_member_id"
    t.index ["space_id"], name: "index_space_members_on_space_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "hidden"
    t.boolean "tags_enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.bigint "space_id"
    t.string "name"
    t.string "c_id"
    t.integer "orderindex"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_statuses_on_space_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "space_id"
    t.string "name"
    t.string "tag_fg"
    t.string "tag_bg"
    t.integer "creator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_tags_on_space_id"
  end

  add_foreign_key "members", "spaces"
  add_foreign_key "space_members", "members"
  add_foreign_key "space_members", "spaces"
  add_foreign_key "statuses", "spaces"
  add_foreign_key "tags", "spaces"
end
