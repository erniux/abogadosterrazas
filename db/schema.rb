# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_08_040347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abogados", force: :cascade do |t|
    t.string "nombre"
    t.string "iniciales"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accion_instancia", force: :cascade do |t|
    t.string "accion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "audiencia", force: :cascade do |t|
    t.date "fecha"
    t.date "asignado"
    t.text "comentarios"
    t.bigint "expediente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expediente_id"], name: "index_audiencia_on_expediente_id"
  end

  create_table "audiencia_expedientes", force: :cascade do |t|
    t.datetime "fecha"
    t.string "asignado"
    t.text "comentarios"
    t.bigint "expediente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "estatus", default: "0"
    t.bigint "estatus_audiencia_id"
    t.datetime "fecha_fin"
    t.index ["estatus_audiencia_id"], name: "index_audiencia_expedientes_on_estatus_audiencia_id"
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

  create_table "cuestionarios", force: :cascade do |t|
    t.string "nombre"
    t.string "appaterno"
    t.string "apmaterno"
    t.string "calle"
    t.string "numero"
    t.string "colonia"
    t.string "municipio"
    t.string "estado"
    t.string "pais"
    t.string "codigo_postal"
    t.string "correo_electronico"
    t.string "nombre_contratante"
    t.string "puesto_contratante"
    t.string "nombre_jefe_directo"
    t.string "puesto_jefe_directo"
    t.string "puesto"
    t.text "funciones"
    t.string "lugar_contratacion"
    t.string "calle_contratacion"
    t.string "numero_contratacion"
    t.string "colonia_contratacion"
    t.string "municipio_contratacion"
    t.string "estado_contrtacion"
    t.string "pais_contratacion"
    t.string "codigo_postal_contratacion"
    t.text "actividad_laboral"
    t.string "horario_trabajo"
    t.string "dias_trabajo"
    t.float "salario_contratacion"
    t.string "frecuencia_pago"
    t.string "esquema_contratacion"
    t.string "prestaciones"
    t.string "forma_pago_salario"
    t.date "fecha_ingreso_laboral"
    t.date "fecha_separacion_laboral"
    t.time "hora_separacion_laboral"
    t.string "nombre_responsable_despido"
    t.string "puesto_responsable_despido"
    t.string "lugar_despido"
    t.text "manifiesto_despido"
    t.string "adeudos_laborales"
    t.string "numero_imss"
    t.boolean "imss_prestacion"
    t.string "credito_infonavit"
    t.boolean "infonavit_prestacion"
    t.boolean "afore_prestacion"
    t.string "afore_nombre"
    t.boolean "accidentes_de_trabajo"
    t.text "accidentes_detalle"
    t.integer "adeudo_vacaciones_dias"
    t.float "adeudo_vacaciones_monto"
    t.integer "adeudo_vacaciones_anios"
    t.integer "adeudo_prima_vacacional_dias"
    t.float "adeudo_prima_vacacional_monto"
    t.integer "adeudo_prima_vacacional_anios"
    t.integer "adeudo_aguinaldo_dias"
    t.float "adeudo_aguinaldo_monto"
    t.integer "adeudo_aguinaldo_anios"
    t.integer "adeudo_tiempo_extra_dias"
    t.float "adeudo_tiempo_extra_monto"
    t.integer "adeudo_tiempo_extra_anios"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "empresa"
    t.string "condicion_salud"
    t.string "otras_prestaciones_nombre_1"
    t.string "otras_prestaciones_nombre_2"
    t.string "otras_prestaciones_nombre_3"
    t.string "otras_prestaciones_nombre_4"
    t.string "otras_prestaciones_adeudo_1"
    t.string "otras_prestaciones_adeudo_2"
    t.string "otras_prestaciones_adeudo_3"
    t.string "otras_prestaciones_adeudo_4"
  end

  create_table "denuncia_penals", force: :cascade do |t|
    t.string "instancia"
    t.string "numero_expediente"
    t.string "demandante"
    t.string "demandado"
    t.string "motivo"
    t.string "comentarios"
    t.date "fecha_demanda"
    t.bigint "expediente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expediente_id"], name: "index_denuncia_penals_on_expediente_id"
  end

  create_table "entidad_responsables", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estatus_audiencias", force: :cascade do |t|
    t.string "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estatus_procesals", force: :cascade do |t|
    t.string "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "estatus_procesal_id", default: 0
    t.bigint "entidad_responsable_id"
    t.string "recomendado"
    t.string "en_sociedad"
    t.integer "cliente", default: 0
    t.index ["entidad_responsable_id"], name: "index_expedientes_on_entidad_responsable_id"
    t.index ["estatus_procesal_id"], name: "index_expedientes_on_estatus_procesal_id"
    t.index ["user_id"], name: "index_expedientes_on_user_id"
  end

  create_table "holidays", force: :cascade do |t|
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asignado"
    t.text "comentarios"
    t.text "expediente_id"
    t.text "estatus", default: "festivo"
  end

  create_table "links", force: :cascade do |t|
    t.string "entidad"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumen_expedientes", force: :cascade do |t|
    t.string "comentarios"
    t.date "fecha_notificacion"
    t.bigint "expediente_id"
    t.bigint "estatus_procesal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estatus_procesal_id"], name: "index_resumen_expedientes_on_estatus_procesal_id"
    t.index ["expediente_id"], name: "index_resumen_expedientes_on_expediente_id"
  end

  create_table "resumen_links", force: :cascade do |t|
    t.date "fecha_publicacion"
    t.string "comentarios"
    t.string "accion"
    t.bigint "expediente_id"
    t.bigint "accion_instancium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accion_instancium_id"], name: "index_resumen_links_on_accion_instancium_id"
    t.index ["expediente_id"], name: "index_resumen_links_on_expediente_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "audiencia", "expedientes"
  add_foreign_key "audiencia_expedientes", "estatus_audiencias"
  add_foreign_key "audiencia_expedientes", "expedientes"
  add_foreign_key "audit_logs", "users"
  add_foreign_key "denuncia_penals", "expedientes"
  add_foreign_key "expedientes", "entidad_responsables"
  add_foreign_key "expedientes", "estatus_procesals"
  add_foreign_key "expedientes", "users"
  add_foreign_key "resumen_expedientes", "estatus_procesals"
  add_foreign_key "resumen_expedientes", "expedientes"
  add_foreign_key "resumen_links", "accion_instancia"
  add_foreign_key "resumen_links", "expedientes"
end
