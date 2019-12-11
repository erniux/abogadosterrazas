class CreateAbogados < ActiveRecord::Migration[5.2]
  def change
    create_table :abogados do |t|
      t.string :nombre
      t.string :iniciales

      t.timestamps
    end
  end
end
