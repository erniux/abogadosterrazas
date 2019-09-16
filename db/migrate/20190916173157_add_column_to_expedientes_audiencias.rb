class AddColumnToExpedientesAudiencias < ActiveRecord::Migration[5.2]
  def change
  	    add_reference :expedientes, :entidad_responsable, foreign_key: true
  	    add_reference :audiencia_expedientes, :estatus_audiencia, foreign_key: true
  end
end
