Rails.application.routes.draw do

  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'
  
  resources :products

  resources :users do

    collection do
      get 'signup'
      get 'paying'
      get 'information'
      get 'login'
      get 'logout'
    end
  end

  resources :items do

    member do
      get 'purchasing'
    end
  end

end
