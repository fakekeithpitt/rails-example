RailsExample::Application.routes.draw do
  resources :posts, expect: [ :index ]

  root "posts#index"
end
