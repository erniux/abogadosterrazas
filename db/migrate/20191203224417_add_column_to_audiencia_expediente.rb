class AddColumnToAudienciaExpediente < ActiveRecord::Migration[5.2]
  def change
    add_column :audiencia_expedientes, :fecha_fin, :datetime
  end
end
