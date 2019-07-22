class CreateAuditLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :audit_logs do |t|
      t.string :expediente
      t.string :demandante
      t.string :demandado
      t.string :entidad_responsable
      t.string :socio
      t.string :estado_procesal
      t.string :ubicacion_fisica
      t.string :despacho
      t.string :referencia1
      t.string :referencia2
      t.string :referencia3
      t.string :comentarios
      t.string :archivo
      t.string :anio
      t.datetime :fecha_audiencia
      t.string :asignado_audiencia
      t.string :comentarios_audicencia
      t.string :estatus
      t.string :email
      t.string :socio
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip
      t.string :accion

      t.timestamps
    end
  end
end
