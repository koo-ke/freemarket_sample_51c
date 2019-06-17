Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'
  
  resources :products

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

  resources :users do

    collection do
      get 'signup'
      get 'paying'
      get 'information'
      get 'login'
      get 'logout'
    end
  end

  resources :registers do
    collection do
      get 'memberinfo'
      get 'numberverification'
      get 'memberaddfress'
      get 'payment'
      get 'completion'
    end
  end

end
