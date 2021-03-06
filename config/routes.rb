Rails.application.routes.draw do
  devise_for :users
  root 'lists#index'
  resources :lists, except: [:edit, :update] do
  	collection do
    	get 'bookmarks'
    	get 'public'
  	end
  end
  resources :tasks, only: [:create, :destroy]
  resources :notification, only: [:index]
  resources :favorites, only: [:create, :destroy]
  get 'messaging' => 'messaging#stream', :as => 'messaging'
end
