Rails.application.routes.draw do
  resources :products do
    delete :reset, on: :collection
    post :order, on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end
