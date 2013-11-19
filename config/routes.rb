Blog::Application.routes.draw do
  post "order_items/add_item", :as => :orders_item_add
  delete "order_items/:service_id/remove_item" => "order_items#destroy", :as => :orders_item_remove
  
  root 'site#index'  
  resources :orders
  resources :order_items
  resources :services
  resources :caixas
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
 
  get "documents/listar_pagar_disp_baixa" => "documents#listar_disp_baixa", :as => :disponiveis_baixa_pagar, :tipo => 'P'
  get "documents/listar_receber_disp_baixa" => "documents#listar_disp_baixa", :as => :disponiveis_baixa_receber, :tipo => 'R'
  post "documents/baixar" => "documents#baixar", :as => :baixar
  
  get "documents/listar_pagar" => "documents#index", :as => :listar_pagar, :tipo => 'P'
  get "documents/listar_receber" => "documents#index", :as => :listar_receber, :tipo => 'R'
  get "documents/new_pagar" => "documents#new", :as => :new_pagar, :tipo => 'P'
  get "documents/new_receber" => "documents#new", :as => :new_receber, :tipo => 'R'
 
  resources :documents, :only => [:index,:create,:show]
  
  get "extrato/index"  
  
end
