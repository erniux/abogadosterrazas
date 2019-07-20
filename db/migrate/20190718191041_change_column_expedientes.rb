class ChangeColumnExpedientes < ActiveRecord::Migration[5.2]
  def change
  	change_column :audiencia_expedientes, :fecha,  :datetime
  	add_column :audiencia_expedientes, :estatus,  :integer, default: 0
  	
  	 
  end
end
