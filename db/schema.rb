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

ActiveRecord::Schema[8.0].define(version: 2025_01_13_235049) do
  create_table "achats", force: :cascade do |t|
    t.string "designation"
    t.float "prix"
    t.date "date_achat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "joueur_id"
    t.string "etat_paiement", default: "Non crédit"
    t.index ["joueur_id"], name: "index_achats_on_joueur_id"
  end

  create_table "assurances", force: :cascade do |t|
    t.date "date_paiement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "joueur_id"
    t.integer "saison_id", null: false
    t.string "etat_paiement", default: "Non crédit"
    t.float "montant"
    t.index ["joueur_id"], name: "index_assurances_on_joueur_id"
    t.index ["saison_id"], name: "index_assurances_on_saison_id"
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
    t.float "salaire"
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
    t.integer "entraineur_id", null: false
    t.index ["entraineur_id"], name: "index_groupes_on_entraineur_id"
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
    t.string "etat_abonnement", default: "Non crédit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "num_recu"
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
    t.float "montant_abonnement"
    t.float "montant_assurance"
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

  add_foreign_key "achats", "joueurs"
  add_foreign_key "assurances", "joueurs"
  add_foreign_key "assurances", "saisons"
  add_foreign_key "groupes", "entraineurs"
  add_foreign_key "joueurs", "groupes"
  add_foreign_key "joueurs", "parents"
  add_foreign_key "salaires", "entraineurs"
end
