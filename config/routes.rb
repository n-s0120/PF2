Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users
  root to: 'homes#top'
  get '/search' => 'searches#search'
  resources :articles do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  resources :flowcharts, only: [:new, :create, :index, :show, :destroy]
end