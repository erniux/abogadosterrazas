class CreateAccionInstancia < ActiveRecord::Migration[5.2]
  def change
    create_table :accion_instancia do |t|
      t.string :accion

      t.timestamps
    end
  end
end
