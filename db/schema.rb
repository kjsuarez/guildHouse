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

ActiveRecord::Schema.define(version: 20150917020116) do

  create_table "action_ownerships", force: :cascade do |t|
    t.integer  "monster_id"
    t.integer  "character_id"
    t.integer  "combat_action_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "armors", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "cash_value"
    t.boolean  "shield"
    t.integer  "armor_bonus"
    t.integer  "max_dex_bonus"
    t.integer  "armor_penalty"
    t.integer  "spell_failure"
    t.boolean  "masterwork"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "character_data", force: :cascade do |t|
    t.integer  "current_hp"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "character_id"
    t.integer  "encounter_id"
    t.integer  "dice"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "constitution"
    t.integer  "intelligence"
    t.integer  "wisdom"
    t.integer  "charisma"
    t.boolean  "saves_rolled"
  end

  add_index "character_data", ["character_id"], name: "index_character_data_on_character_id"
  add_index "character_data", ["encounter_id"], name: "index_character_data_on_encounter_id"

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
    t.string   "equipment"
    t.string   "name"
    t.string   "status"
    t.boolean  "bleeding"
    t.boolean  "grappled"
    t.integer  "current_hp"
  end

  add_index "characters", ["dice"], name: "index_characters_on_dice"
  add_index "characters", ["game_id"], name: "index_characters_on_game_id"
  add_index "characters", ["user_id"], name: "index_characters_on_user_id"

  create_table "combat_actions", force: :cascade do |t|
    t.string   "name"
    t.string   "damage"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "area"
    t.integer  "onset"
    t.string   "saving_throw"
    t.integer  "saving_value"
    t.integer  "frequency"
    t.integer  "limit"
    t.integer  "cure"
    t.integer  "user_id"
  end

  add_index "combat_actions", ["user_id"], name: "index_combat_actions_on_user_id"

  create_table "condition_counters", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "character_id"
    t.integer  "monster_datum_id"
    t.integer  "combat_action_id"
    t.integer  "turns_left"
    t.integer  "onset_counter"
    t.integer  "frequency_counter"
    t.integer  "character_datum_id"
  end

  add_index "condition_counters", ["character_datum_id"], name: "index_condition_counters_on_character_datum_id"
  add_index "condition_counters", ["character_id"], name: "index_condition_counters_on_character_id"
  add_index "condition_counters", ["combat_action_id"], name: "index_condition_counters_on_combat_action_id"
  add_index "condition_counters", ["monster_datum_id"], name: "index_condition_counters_on_monster_datum_id"

  create_table "encounter_ownerships", force: :cascade do |t|
    t.integer  "encounter_id"
    t.integer  "monster_id"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "encounters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
    t.boolean  "active"
    t.string   "name"
    t.integer  "turn"
  end

  add_index "encounters", ["game_id"], name: "index_encounters_on_game_id"

  create_table "games", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "character_id"
    t.string   "statement"
    t.integer  "gamemaster_id"
    t.integer  "turn"
    t.string   "name"
  end

  add_index "games", ["character_id"], name: "index_games_on_character_id"
  add_index "games", ["name"], name: "index_games_on_name", unique: true
  add_index "games", ["turn"], name: "index_games_on_turn"

  create_table "item_ownerships", force: :cascade do |t|
    t.integer  "armor_id"
    t.integer  "weapon_id"
    t.integer  "user_id"
    t.integer  "character_id"
    t.integer  "game_id"
    t.integer  "combat_action_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "monster_data", force: :cascade do |t|
    t.integer  "current_hp"
    t.boolean  "bleeding"
    t.string   "status"
    t.boolean  "grappled"
    t.integer  "monster_id"
    t.integer  "encounter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "dice"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "constitution"
    t.integer  "intelligence"
    t.integer  "wisdom"
    t.integer  "charisma"
    t.boolean  "saves_rolled"
  end

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
    t.integer  "dice"
    t.integer  "hit_points"
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

  create_table "weapons", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "cash_value"
    t.string   "weapon_type"
    t.string   "weapon_use"
    t.string   "hands"
    t.string   "size"
    t.string   "damage_type"
    t.boolean  "masterwork"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
