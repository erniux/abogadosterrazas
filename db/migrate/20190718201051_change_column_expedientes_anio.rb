class ChangeColumnExpedientesAnio < ActiveRecord::Migration[5.2]
  def change
  	remove_column :expedientes, :año
  	add_column :expedientes, :anio, :integer
  end
end
