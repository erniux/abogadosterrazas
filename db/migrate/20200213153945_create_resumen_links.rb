class CreateResumenLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :resumen_links do |t|
      t.date :fecha_publicacion
      t.string :comentarios
      t.string :accion
      t.references :expediente, foreign_key: true
      t.references :accion_instancium, foreign_key: true

      t.timestamps
    end
  end
end
