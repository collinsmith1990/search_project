Rails.application.routes.draw do
  root 'search_terms#index'
  resources :search_terms, only: [:index]
  resources :searches, only: [:create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
