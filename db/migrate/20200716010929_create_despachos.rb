class CreateDespachos < ActiveRecord::Migration[6.0]
  def change
    create_table :despachos do |t|
      t.string :colonia
      t.string :calle
      t.string :numero

      t.timestamps
    end
  end
end
