Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  resources :books, only: [:index, :show]
  resources :authors, only: [:show]
  resources :users, only: [:index, :show]
end
