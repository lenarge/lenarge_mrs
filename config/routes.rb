LenargeMrs::Application.routes.draw do
  resources :ferro_ctes

  resources :rodo_ctes

  devise_for :users

  root 'home#index'
end
