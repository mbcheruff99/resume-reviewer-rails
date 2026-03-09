Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  get "/jobs" => "jobs#index"
  get "jobs/:id" => "jobs#show"
  post "/jobs" => "jobs#create"
  patch "/jobs/:id" => "jobs#update"
  delete "/jobs/:id" => "jobs#destroy"

end
