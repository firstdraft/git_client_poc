Rails.application.routes.draw do

  namespace :dev do
    namespace :git do
      get "/" => "commands#status"
      get "status" => "commands#status"
      resources :branches, only: [:create]
      get "branches/checkout"
      resources :commits
      post "commits/stash"
      get "commits/push"
    end
  end

end
