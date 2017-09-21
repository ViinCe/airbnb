Rails.application.routes.draw do

  devise_for :users, :path=>'',
                    :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
                    :controllers=>{:registrations=>'registrations'}

  root 'pages#home'
  
  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get 'your_trips' => 'reservations#your_trips', path: 'mes_voyages' 

  resources :users, only: [:show]
  resources :rooms, path: 'mes_annonces' do
    resources :reservations, only: [:create]
  end
  resources :photos

end
