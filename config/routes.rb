Rails.application.routes.draw do
  get "habitats/index"
  get "habitats/show"
  get "categories/index"
  get "categories/show"
  get "species/index"
  get "species/show"
  get "pages/about"
  root 'species#index'
  get 'about', to: 'pages#about'

  resources :species, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :habitats, only: [:index, :show]
end
