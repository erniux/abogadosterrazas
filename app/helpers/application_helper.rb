module ApplicationHelper

	 def format_date(date)
	 	l date, format: '%m-%d-%Y'
	 end


	 def ultimo_estado(expediente)
	 	 arr = [] 
          i = 0
          expediente.audiencia_expedientes.each do |audiencia|
              arr[i] = {"fecha"=>audiencia.fecha, "estatus"=>audiencia.estatus_audiencia.estatus, "fuente"=>"audiencia"} 
              i = i + 1
          end

          expediente.resumen_expedientes.order(:fecha_notificacion).each do |despacho|
              arr[i] = {"fecha"=>despacho.fecha_notificacion, "estatus"=>despacho.estatus_procesal.estatus, "fuente"=>"despacho"} 
              i = i + 1
          end

          expediente.resumen_links.each do |instancia|
              arr[i] = {"fecha"=>instancia.fecha_publicacion, "estatus"=>instancia.accion_instancium.accion, "fuente"=>"instancia"} 
              i = i + 1
          end
          arr_values = (arr.map {|item| [item["fecha"], item["estatus"], item["fuente"]]})
          arr_sorted = arr_values.sort { |l, r| l[0]<=>r[0] }
		  arr_sorted.last[1]
	 end

	 def linea_tiempo(expediente)
	 	arr = [] 
          i = 0
          expediente.audiencia_expedientes.each do |audiencia|
              arr[i] = {"fecha"=>audiencia.fecha, "estatus"=>audiencia.estatus_audiencia.estatus, "fuente"=>"audiencia"} 
              i = i + 1
          end

          expediente.resumen_expedientes.order(:fecha_notificacion).each do |despacho|
              arr[i] = {"fecha"=>despacho.fecha_notificacion, "estatus"=>despacho.estatus_procesal.estatus, "fuente"=>"despacho"} 
              i = i + 1
          end

          expediente.resumen_links.each do |instancia|
              arr[i] = {"fecha"=>instancia.fecha_publicacion, "estatus"=>instancia.accion_instancium.accion, "fuente"=>"instancia"} 
              i = i + 1
          end
          arr_values = (arr.map {|item| [item["fecha"], item["estatus"], item["fuente"]]})
          arr_sorted = arr_values.sort { |l, r| l[0]<=>r[0] }
	 end

end

 