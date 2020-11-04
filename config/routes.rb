Rails.application.routes.draw do
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  resources :treatments

  resources :users do
    resources :prescriptions
  end

end
