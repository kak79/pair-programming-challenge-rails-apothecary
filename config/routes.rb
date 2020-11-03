Rails.application.routes.draw do
  resources :treatments
  
  resources :users do 
    resources :prescriptions
  end
end
