Rails.application.routes.draw do

  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations' }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'
  
  resources :products do
    collection do
      get 'search'
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchases, only: [:index] do
    member do
      get 'index', to: 'purchases#index'
      post 'pay', to: 'purchases#pay'
    end
  end

  devise_scope :user do
    constraint = lambda do |request|
      request.env["devise.mapping"] = Devise.mappings[scope]
      true
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
