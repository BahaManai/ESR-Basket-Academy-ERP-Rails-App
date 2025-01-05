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

ActiveRecord::Schema[8.0].define(version: 2025_01_05_185233) do
  create_table "achats", force: :cascade do |t|
    t.string "designation"
    t.float "prix"
    t.date "date_achat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "joueur_id", null: false
    t.index ["joueur_id"], name: "index_achats_on_joueur_id"
  end

  create_table "assurances", force: :cascade do |t|
    t.float "montant"
    t.date "date_paiement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "joueur_id", null: false
    t.index ["joueur_id"], name: "index_assurances_on_joueur_id"
  end

  create_table "credits", force: :cascade do |t|
    t.string "type_credit"
    t.float "montant"
    t.string "statut"
    t.date "date_credit"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "joueur_id", null: false
    t.index ["joueur_id"], name: "index_credits_on_joueur_id"
  end

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

  create_table "groupes", force: :cascade do |t|
    t.integer "heure_debut"
    t.integer "heure_fin"
    t.string "jour"
    t.string "terrain"
    t.string "string"
    t.integer "age_min"
    t.integer "age_max"
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
    t.integer "parent_id"
    t.integer "groupe_id"
    t.index ["groupe_id"], name: "index_joueurs_on_groupe_id"
    t.index ["parent_id"], name: "index_joueurs_on_parent_id"
  end

  create_table "paiements", force: :cascade do |t|
    t.integer "joueur_id"
    t.float "montant"
    t.date "date_abonnement"
    t.date "date_encaissement"
    t.string "etat_abonnement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["joueur_id"], name: "index_paiements_on_joueur_id"
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

  create_table "salaires", force: :cascade do |t|
    t.float "salaire"
    t.integer "mois"
    t.integer "annee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entraineur_id", null: false
    t.index ["entraineur_id"], name: "index_salaires_on_entraineur_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "Name"
    t.string "email"
    t.string "mot_de_passe"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "achats", "joueurs"
  add_foreign_key "assurances", "joueurs"
  add_foreign_key "credits", "joueurs"
  add_foreign_key "joueurs", "groupes"
  add_foreign_key "joueurs", "parents"
  add_foreign_key "salaires", "entraineurs"
end
