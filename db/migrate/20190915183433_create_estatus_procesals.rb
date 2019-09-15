class CreateEstatusProcesals < ActiveRecord::Migration[5.2]
  def change
    create_table :estatus_procesals do |t|
      t.string :estatus

      t.timestamps
    end
  end
end
