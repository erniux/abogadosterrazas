module ExpedientesHelper
	def color_año anio, expediente
		case anio
		when 2003
			content_tag(:td, content_tag(:a_href, expediente), class: 'content-box-black')
		when 2006
			content_tag(:td, expediente, class: 'content-box-yellow')
		when 2010
			content_tag(:td, expediente, class: 'content-box-green')
		when 2011
			content_tag(:td, expediente, class: 'content-box-black')
		when 2012
			content_tag(:td, expediente, class: 'content-box-black')
		when 2013
			content_tag(:td, expediente, class: 'content-box-purple')
		when 2014
			content_tag(:td, expediente, class: 'content-box-grey')
		when 2015
			content_tag(:td, expediente, class: 'content-box-rojo')
		when 2016
			content_tag(:td, expediente, class: 'content-box-green')
		when 2017
			content_tag(:td, expediente, class: 'content-box-orange')
		when 2018
			content_tag(:td, expediente, class: 'content-box-blue')
		when 2019
			 content_tag(:td, expediente, class: "content-box-pink")
		when 2020
			content_tag(:td, expediente, class: 'content-box-brown')

		end

	end

	def color_entidad entidad_responsable
		case entidad_responsable
		when  'Junta Federal',  'JUNTA FEDERAL'
			content_tag(:td, entidad_responsable, class: "content-box-federal")
		when  'Junta Local', 'JUNTA LOCAL'  
			content_tag(:td, entidad_responsable, class: "content-box-local")
		when  'Burocrático',  'BUROCRÀTICO'
			content_tag(:td, entidad_responsable, class: "content-box-Buro") 
		else
			content_tag(:td, entidad_responsable)
		end
	end

	 



#concat(link_to 'root link', root_path)

end
