class CreateEntidadResponsables < ActiveRecord::Migration[5.2]
  def change
    create_table :entidad_responsables do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
