class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :archivero
      t.integer :cajon
      t.references :despacho, null: false, foreign_key: true

      t.timestamps
    end
  end
end
