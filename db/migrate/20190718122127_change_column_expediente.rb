class ChangeColumnExpediente < ActiveRecord::Migration[5.2]
  def change
  	rename_column :expedientes, :estatus, :estado_procesal
  	add_column :expedientes, :instancia, :string
  end
end
