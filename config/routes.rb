Rails.application.routes.draw do
  
  get 'paginas/inicio'
  get 'paginas/catalogos'

  devise_for :users, path: '', path_names: { sign_in: 'ingresar', sign_out: 'Salir', sign_up: 'registrar'}

  resources :expedientes
  resources :audiencias
  resources :audit_logs

root to: "paginas#inicio" 


end
