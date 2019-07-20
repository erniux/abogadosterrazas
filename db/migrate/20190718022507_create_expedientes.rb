class CreateExpedientes < ActiveRecord::Migration[5.2]
  def change
    create_table :expedientes do |t|
      t.date :año
      t.string :expediente
      t.string :demandante
      t.string :demandado
      t.string :entidad_responsable
      t.string :socio
      t.integer :estatus
      t.string :ubicacion_fisica
      t.string :despacho

      t.timestamps
    end
  end
end
