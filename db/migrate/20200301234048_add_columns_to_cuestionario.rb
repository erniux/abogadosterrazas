class AddColumnsToCuestionario < ActiveRecord::Migration[5.2]
  def change
    add_column :cuestionarios, :empresa, :string
    add_column :cuestionarios, :condicion_salud, :string
    add_column :cuestionarios, :otras_prestaciones_nombre_1, :string
    add_column :cuestionarios, :otras_prestaciones_nombre_2, :string
    add_column :cuestionarios, :otras_prestaciones_nombre_3, :string
    add_column :cuestionarios, :otras_prestaciones_nombre_4, :string
    add_column :cuestionarios, :otras_prestaciones_adeudo_1, :string
    add_column :cuestionarios, :otras_prestaciones_adeudo_2, :string
    add_column :cuestionarios, :otras_prestaciones_adeudo_3, :string
    add_column :cuestionarios, :otras_prestaciones_adeudo_4, :string
  end
end
