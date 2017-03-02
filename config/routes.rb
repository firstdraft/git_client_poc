Rails.application.routes.draw do

  namespace :dev do
    namespace :git do
      get "/" => "commands#log"
      get "log" => "commands#log"
      resources :branches
      resources :commits
      post "commits/stash" => "commits#stash"
    end
  end

end
