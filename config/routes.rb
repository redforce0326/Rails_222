Rails.application.routes.draw do
  get 'rooms/index' =>"rooms#index"
  get 'rooms/new' =>"rooms#new"
  post 'rooms/create' =>"rooms#create"
  get 'rooms/search' =>"rooms#search"
  get 'rooms/:id' =>"rooms#show"
  get '/' => "home#top"
  get "/reservations/confirm" => "reservations#confirm"
  post "/reservations/create" => "reservations#create"
  get "reservations/index" => "reservations#index"
  get "/reservations/:id" => "reservations#complete"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
   registrations: 'users/registrations'
 }
  devise_scope :user do
    get 'users/profile' => 'users/registrations#show'
    post 'users/create' => 'users/registrations#create'
  end
end
