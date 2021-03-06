Rails.application.routes.draw do
  get 'paginas/inicio', as: 'inicio'
  get 'paginas/consulta', as: 'consulta'
  get 'paginas/estadistica', as: 'estadistica'


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
  resources :cuestionarios
  resources :despachos
  
  
  root to: "paginas#inicio" 


end
