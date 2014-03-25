LenargeMrs::Application.routes.draw do
  resources :ferro_ctes do
    collection do
      post :import
      get :prepare_to_import
    end
  end

  resources :rodo_ctes do
    collection do
      post :import
      get :prepare_to_import
    end
  end

  get 'allocate_ctes' => 'cte_allocator#allocate'
  get 'report' => 'report#mrs_export'
  post 'report' => 'report#mrs_export_extract'

  devise_for :users

  root 'home#index'
end
