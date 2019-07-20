class CreateAudiencia < ActiveRecord::Migration[5.2]
  def change
    create_table :audiencia do |t|
      t.date :fecha
      t.date :asignado
      t.text :comentarios
      t.belongs_to :expediente, foreign_key: true

      t.timestamps
    end
  end
end
