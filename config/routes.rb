LenargeMrs::Application.routes.draw do
  resources :rodo_ctes

  devise_for :users

  root 'home#index'
end
