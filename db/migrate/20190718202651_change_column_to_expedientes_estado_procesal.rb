class ChangeColumnToExpedientesEstadoProcesal < ActiveRecord::Migration[5.2]
  def change
  	change_column :expedientes, :estado_procesal,  :string
  end
end
