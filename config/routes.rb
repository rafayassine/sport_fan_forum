Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :answers
  end
  root "posts#index"
end
