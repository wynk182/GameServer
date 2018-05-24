Rails.application.routes.draw do

  post 'api/auth' => 'requests#auth_request'
  post 'api/game' => 'requests#game_request'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
