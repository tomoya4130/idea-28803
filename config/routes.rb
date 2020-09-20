Rails.application.routes.draw do
  devise_for :users
  root to: "ideas#index"
  resources :ideas do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:new, :create]
  end

end
