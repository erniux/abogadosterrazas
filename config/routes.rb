Rails.application.routes.draw do
  get 'paginas/inicio', as: 'inicio'


  devise_for :users, path: '', path_names: { sign_in: 'ingresar', sign_out: 'Salir', sign_up: 'registrar'}

  resources :expedientes do
    delete :delete_upload_documentos
  end

  
  resources :estatus_procesals
  resources :estatus_audiencias
  resources :entidad_responsables
  resources :audiencias
  resources :audit_logs
  resources :holidays
  resources :abogados
  resources :links
  resources :accion_instancia
  
  root to: "paginas#inicio" 


end
