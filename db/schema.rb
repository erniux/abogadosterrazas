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

ActiveRecord::Schema.define(version: 2019_07_19_180834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audiencia_expedientes", force: :cascade do |t|
    t.datetime "fecha"
    t.string "asignado"
    t.text "comentarios"
    t.bigint "expediente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "estatus", default: "0"
    t.index ["expediente_id"], name: "index_audiencia_expedientes_on_expediente_id"
  end

  create_table "expedientes", force: :cascade do |t|
    t.string "expediente"
    t.string "demandante"
    t.string "demandado"
    t.string "entidad_responsable"
    t.string "socio"
    t.string "estado_procesal"
    t.string "ubicacion_fisica"
    t.string "despacho"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "referencia1"
    t.string "referencia2"
    t.string "referencia3"
    t.text "comentarios"
    t.text "archivo"
    t.integer "anio"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "socio"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audiencia_expedientes", "expedientes"
end
