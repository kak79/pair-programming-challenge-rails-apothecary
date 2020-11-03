Rails.application.routes.draw do

  resources :users, only: [:index, :new, :show] do
    resources :prescriptions
  end

  post '/users/:id', to: 'users#show'

  get '/users/login', to: 'users#login', as: 'login'

end
