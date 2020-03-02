class CreateCuestionarios < ActiveRecord::Migration[5.2]
  def change
    create_table :cuestionarios do |t|
      t.string :nombre
      t.string :appaterno
      t.string :apmaterno
      t.string :calle
      t.string :numero
      t.string :colonia
      t.string :municipio
      t.string :estado
      t.string :pais
      t.string :codigo_postal
      t.string :correo_electronico
      t.string :nombre_contratante
      t.string :puesto_contratante
      t.string :nombre_jefe_directo
      t.string :puesto_jefe_directo
      t.string :puesto
      t.text :funciones
      t.string :lugar_contratacion
      t.string :calle_contratacion
      t.string :numero_contratacion
      t.string :colonia_contratacion
      t.string :municipio_contratacion
      t.string :estado_contrtacion
      t.string :pais_contratacion
      t.string :codigo_postal_contratacion
      t.text :actividad_laboral
      t.string :horario_trabajo
      t.string :dias_trabajo
      t.float :salario_contratacion
      t.string :frecuencia_pago
      t.string :esquema_contratacion
      t.string :prestaciones
      t.string :forma_pago_salario
      t.date :fecha_ingreso_laboral
      t.date :fecha_separacion_laboral
      t.time :hora_separacion_laboral
      t.string :nombre_responsable_despido
      t.string :puesto_responsable_despido
      t.string :lugar_despido
      t.text :manifiesto_despido
      t.string :adeudos_laborales
      t.string :numero_imss
      t.boolean :imss_prestacion
      t.string :credito_infonavit
      t.boolean :infonavit_prestacion
      t.boolean :afore_prestacion
      t.string :afore_nombre
      t.boolean :accidentes_de_trabajo
      t.text :accidentes_detalle
      t.integer :adeudo_vacaciones_dias
      t.float :adeudo_vacaciones_monto
      t.integer :adeudo_vacaciones_anios
      t.integer :adeudo_prima_vacacional_dias
      t.float :adeudo_prima_vacacional_monto
      t.integer :adeudo_prima_vacacional_anios
      t.integer :adeudo_aguinaldo_dias
      t.float :adeudo_aguinaldo_monto
      t.integer :adeudo_aguinaldo_anios
      t.integer :adeudo_tiempo_extra_dias
      t.float :adeudo_tiempo_extra_monto
      t.integer :adeudo_tiempo_extra_anios

      t.timestamps
    end
  end
end
