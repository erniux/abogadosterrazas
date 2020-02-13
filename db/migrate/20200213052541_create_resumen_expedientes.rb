class CreateResumenExpedientes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumen_expedientes do |t|
      t.string :comentarios
      t.date :fecha_notificacion
      t.references :expediente, foreign_key: true
      t.references :estatus_procesal, foreign_key: true

      t.timestamps
    end
  end
end
