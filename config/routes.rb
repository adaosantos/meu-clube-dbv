Rails.application.routes.draw do
  scope "/auth" do
    get "/auth0/callback", to: "auth0#callback"
    get "/failure", to: "auth0#failure"
    get "/logout", to: "auth0#logout"
  end

  resources :clubs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
