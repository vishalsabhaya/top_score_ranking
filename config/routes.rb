Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :players, only: [:show]
    resources :scores, only: [:index, :show, :create, :destroy]
  end
end
