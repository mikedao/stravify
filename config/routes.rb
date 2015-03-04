Rails.application.routes.draw do

  get "/auth/:provider/callback", to: "sessions#create"
  root "static_pages#home"
  get "/test_user", to: "static_pages#test_user"
  get "/dashboard", to: "dashboard#index"

end
