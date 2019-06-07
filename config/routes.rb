Rails.application.routes.draw do

  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'
  
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

  get "/registration/member-info" => 'registration#memberinfo'
  get "/registration/number-verification" => 'registration#numberverification'
  get "/registration/member-addfress" => 'registration#memberaddfress'
  get "/registration/payment" => 'registration#payment'
  get "/registration/completion" => 'registration#completion'

end
