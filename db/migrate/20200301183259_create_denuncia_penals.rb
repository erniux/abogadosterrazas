class CreateDenunciaPenals < ActiveRecord::Migration[5.2]
  def change
    create_table :denuncia_penals do |t|
      t.string :instancia
      t.string :numero_expediente
      t.string :demandante
      t.string :demandado
      t.string :motivo
      t.string :comentarios
      t.date :fecha_demanda
      t.references :expediente, foreign_key: true

      t.timestamps
    end
  end
end
