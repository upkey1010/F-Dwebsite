Rails.application.routes.draw do

  get 'sessions/new'
  get '/addcategory', to: 'categories#new'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get  '/addfood',    to: 'foods#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :foods do
    resources :reviews, except: [:show, :index]
  end

  resources :categories
  resources :users

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
