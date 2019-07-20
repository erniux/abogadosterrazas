class AddColumnExpedientes < ActiveRecord::Migration[5.2]
  def change
  	  	add_column :expedientes, :referencia2, :string
  	  	add_column :expedientes, :referencia3, :string
  	  	add_column :expedientes, :comentarios, :text
  	  	add_column :expedientes, :archivo, :text
  	  	rename_column :expedientes, :instancia, :referencia1
  end
end
