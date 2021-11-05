Rails.application.routes.draw do
  resources :games do
    resources :moves, only: [:create]
  end

  root to: 'games#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
