Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: { sign_in: 'ingresar', sign_out: 'Salir', sign_up: 'registrar'}

  resources :expedientes
  resources :audiencias
  resources :audit_logs

root to: "expedientes#index" 


end
