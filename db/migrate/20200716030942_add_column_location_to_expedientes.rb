class AddColumnLocationToExpedientes < ActiveRecord::Migration[6.0]
  def change
    add_column :expedientes, :location, :string
  end
end
