Rails.application.routes.draw do
  devise_for :users
  root to: "ideas#index"
  resources :ideas, only: [:index, :new, :create, :show, :edit, :update]
end
