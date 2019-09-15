class AddEstatusProcesalToExpedientes < ActiveRecord::Migration[5.2]
  def change
    add_reference :expedientes, :estatus_procesal, foreign_key: true
  end
end
