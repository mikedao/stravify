Rails.application.routes.draw do

  root "static_pages#home"
  get "/test_user", to: "static_pages#test_user"

end
