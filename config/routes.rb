Rails.application.routes.draw do

  root 'product#index'
  devise_for :users

  resources :product do
    member do
      get 'carts/new'
      # get 'addcart'
    end
    resources :carts
  end

  resources :carts do
    collection do
      get 'checkout'
    end
  end

end
