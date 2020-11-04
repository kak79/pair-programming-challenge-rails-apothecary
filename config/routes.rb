Rails.application.routes.draw do
resources :treatments

  resources :users do
    resources :prescriptions
  end

  
    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"
  


end
