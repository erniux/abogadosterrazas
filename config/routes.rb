Rails.application.routes.draw do
  get 'paginas/inicio', as: 'inicio'


  devise_for :users, path: '', path_names: { sign_in: 'ingresar', sign_out: 'Salir', sign_up: 'registrar'}

  resources :expedientes
  resources :estatus_procesals
  resources :estatus_audiencias
  resources :entidad_responsables
  resources :audiencias
  resources :audit_logs
  resources :holidays
  resources :abogados
  resources :links
  
  root to: "paginas#inicio" 


end
