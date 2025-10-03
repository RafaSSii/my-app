Rails.application.routes.draw do
  resource :unsubscribe, only: [ :show ]
  resource :session
  resources :passwords, param: :token
  resources :products do
    resources :subscribers, only: [ :create ]
  end
  root "products#index"
end
