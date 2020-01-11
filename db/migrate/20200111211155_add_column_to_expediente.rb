class AddColumnToExpediente < ActiveRecord::Migration[5.2]
  def change
    add_column :expedientes, :recomendado, :string
    add_column :expedientes, :en_sociedad, :string
  end
end
