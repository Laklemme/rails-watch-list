Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :new, :create, :show] do
    resources :bookmarks, only: [:new, :create, :index]
  end
  resources :bookmarks, only: :destroy
  resources :movies, only: [:index, :show]
end
