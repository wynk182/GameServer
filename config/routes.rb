Rails.application.routes.draw do

  resources :invites
  resources :games
  post 'api/auth' => 'requests#auth_request'
  post 'api/game' => 'requests#game_request'
  post 'api/new_game' => 'requests#new_game_request'
  post 'api/invite' => 'requests#invite_user'
  post 'api/end_turn' => 'requests#end_turn_request'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
