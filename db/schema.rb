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

ActiveRecord::Schema.define(version: 20150706012429) do

  create_table "characters", force: :cascade do |t|
    t.string   "strength"
    t.string   "dexterity"
    t.string   "constitution"
    t.string   "intelligence"
    t.string   "wisdom"
    t.string   "charisma"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.string   "race"
    t.string   "character_class"
    t.integer  "game_id"
    t.integer  "hit_points"
    t.text     "level_table"
    t.string   "class_skills"
    t.text     "skill_set"
    t.string   "race_bonus_choice"
    t.integer  "dice"
  end

  add_index "characters", ["dice"], name: "index_characters_on_dice"
  add_index "characters", ["game_id"], name: "index_characters_on_game_id"
  add_index "characters", ["user_id"], name: "index_characters_on_user_id"

  create_table "games", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "character_id"
    t.string   "statement"
    t.integer  "gamemaster_id"
    t.integer  "turn"
  end

  add_index "games", ["character_id"], name: "index_games_on_character_id"
  add_index "games", ["turn"], name: "index_games_on_turn"

  create_table "monster_ownerships", force: :cascade do |t|
    t.integer  "monster_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
  end

  add_index "monster_ownerships", ["game_id"], name: "index_monster_ownerships_on_game_id"

  create_table "monsters", force: :cascade do |t|
    t.integer  "cr"
    t.integer  "xp"
    t.integer  "init_mod"
    t.integer  "ac"
    t.integer  "hp"
    t.integer  "fort_save"
    t.integer  "ref_save"
    t.integer  "strength"
    t.integer  "will_save"
    t.string   "dexterity"
    t.string   "constitution"
    t.string   "intelligence"
    t.string   "wisdom"
    t.string   "charisma"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.string   "flavor_text"
  end

  create_table "statements", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "character_id"
    t.integer  "game_id"
    t.integer  "user_id"
  end

  add_index "statements", ["character_id"], name: "index_statements_on_character_id"
  add_index "statements", ["game_id"], name: "index_statements_on_game_id"
  add_index "statements", ["user_id"], name: "index_statements_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
  end

end
