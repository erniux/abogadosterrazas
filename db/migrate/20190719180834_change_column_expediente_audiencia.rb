class ChangeColumnExpedienteAudiencia < ActiveRecord::Migration[5.2]
  def change
  	  	change_column :audiencia_expedientes, :estatus,  :string
  end
end
