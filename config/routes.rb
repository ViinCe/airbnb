Rails.application.routes.draw do

  devise_for :users, :path=>'',
                    :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
                    :controllers=>{:registrations=>'registrations'}

  root 'pages#home'
  
  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get 'your_trips' => 'reservations#your_trips', path: 'mes_voyages' 
  get 'your_reservations' => 'reservations#your_reservations', path: 'mes_reservations' 

  get '/search' => 'pages#search'

  resources :users, only: [:show]
  resources :rooms, path: 'mes_annonces' do
    resources :reservations, only: [:create]
    resources :reviews, only: [:create, :destroy]
  end
  resources :photos

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
end
