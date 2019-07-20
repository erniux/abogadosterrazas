module TerrazasCopyright
	extend ActiveSupport::Concern

	included do
		before_action :set_copyright
	end

	def set_copyright
	@copyright = TerrazasCR::Renderer.copyright 'Abogados Terrazas','Todos los derechos reservados'
  end

  module TerrazasCR
	class Renderer
		def self.copyright name, msg
			"&copy; #{Time.now.year} | #{name} | #{msg}".html_safe
		end
	end
end

end