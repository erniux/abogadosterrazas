class AddColumnToHolidays < ActiveRecord::Migration[5.2]
  def change
  	add_column :holidays, :asignado, :string
  	add_column :holidays, :comentarios, :text
  	add_column :holidays, :expediente_id, :text
  	add_column :holidays, :estatus, :text, default: 'festivo'
  	remove_column :holidays, :nombre
  end
end
