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

ActiveRecord::Schema[8.0].define(version: 2025_01_02_144435) do
  create_table "depenses", force: :cascade do |t|
    t.string "designation"
    t.float "prix"
    t.date "date_depense"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entraineurs", force: :cascade do |t|
    t.string "nom"
    t.string "prénom"
    t.integer "téléphone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "joueurs", force: :cascade do |t|
    t.string "nom"
    t.string "prénom"
    t.string "sexe"
    t.date "date_naissance"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string "nom"
    t.string "prénom"
    t.integer "téléphone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saisons", force: :cascade do |t|
    t.date "date_debut"
    t.date "date_fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "Name"
    t.string "email"
    t.string "mot_de_passe"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
