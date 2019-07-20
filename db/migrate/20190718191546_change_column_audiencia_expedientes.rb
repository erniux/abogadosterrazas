class ChangeColumnAudienciaExpedientes < ActiveRecord::Migration[5.2]
  def change
  	change_column :audiencia_expedientes, :asignado,  :string
  end
end
