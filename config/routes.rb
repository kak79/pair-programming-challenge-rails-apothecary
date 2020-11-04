Rails.application.routes.draw do
  get "/login" => "sessions#login"
  post "/login" => "sessions#post_login"
  delete "/logout" => "sessions#logout"
  resources :treatments

  resources :users do
    resources :prescriptions
  end

end
