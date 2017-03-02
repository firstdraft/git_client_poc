Rails.application.routes.draw do

  namespace :dev do
    namespace :git do
      get "/" => "commands#log"
      get "log" => "commands#log"
      resources :branches
      get "branches/checkout"
      resources :commits
      post "commits/stash"
    end
  end

end
