Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/search' => 'search#search'
  resources :articles do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
end