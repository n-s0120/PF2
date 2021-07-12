Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/search' => 'search#search'
end