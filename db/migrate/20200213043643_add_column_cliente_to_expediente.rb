class AddColumnClienteToExpediente < ActiveRecord::Migration[5.2]
  def change
    add_column :expedientes, :cliente, :integer, default: 0
  end
end
