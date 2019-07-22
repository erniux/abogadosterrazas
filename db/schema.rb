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

ActiveRecord::Schema.define(version: 2019_07_22_150300) do

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

  create_table "audit_logs", force: :cascade do |t|
    t.string "expediente"
    t.string "demandante"
    t.string "demandado"
    t.string "entidad_responsable"
    t.string "socio"
    t.string "estado_procesal"
    t.string "ubicacion_fisica"
    t.string "despacho"
    t.string "referencia1"
    t.string "referencia2"
    t.string "referencia3"
    t.string "comentarios"
    t.string "archivo"
    t.string "anio"
    t.datetime "fecha_audiencia"
    t.string "asignado_audiencia"
    t.string "comentarios_audicencia"
    t.string "estatus"
    t.string "email"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "accion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_audit_logs_on_user_id"
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
    t.bigint "user_id"
    t.index ["user_id"], name: "index_expedientes_on_user_id"
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
    t.string "roles"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audiencia_expedientes", "expedientes"
  add_foreign_key "audit_logs", "users"
  add_foreign_key "expedientes", "users"
end
