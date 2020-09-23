Rails.application.routes.draw do
  devise_for :users
  root to: "ideas#index"
  resources :ideas do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
      get 'rank'
      get 'novelty'
    end
  end

end
