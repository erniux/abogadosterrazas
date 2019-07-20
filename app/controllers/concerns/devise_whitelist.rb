module DeviseWhitelist
	extend ActiveSupport::Concern

  	included do
    	before_action :configure_permitted_parameters, if: :devise_controller?
  	end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:socio])
    devise_parameter_sanitizer.permit(:account_update, keys: [:socio])

    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    	user_params.permit(:socio)
  	end

  end

  attr_writer :login

  def login
    @login || self.socio || self.email
  end

end