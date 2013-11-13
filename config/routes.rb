Blog::Application.routes.draw do  

  resources :caixas

  root 'site#index'
  resources :fornecedors
  resources :accounts
  resources :members
  resources :cities
  resources :states
  resources :users
  resources :profiles, :only => [:show,:edit,:update]
  resources :articles do
    resources :comments
  end
  resources :sessions, :only => [:new,:create,:destroy]
  
  get "site/index"
  get "site/help"
  get "site/about"  
  get "sessions/login" => 'sessions#new', :as => :login
  delete "sessions/logout" => 'sessions#destroy', :as => :logout
 
  get "documents/listar_disp_baixa" => "documents#listar_disp_baixa", :as => :disponiveis_baixa
  post "documents/baixar" => "documents#baixar", :as => :baixar
 
  resources :documents, :only => [:index,:new,:create,:show]
  
  get "extrato/index"  
  
end
