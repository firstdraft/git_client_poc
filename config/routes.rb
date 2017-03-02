Rails.application.routes.draw do

  namespace :dev do
    namespace :git do
      get "/" => "commands#log"
      get "log" => "commands#log"
      resources :branches
      resources :commits
      delete "commits/stash" => "commits#stash"
    end
  end

end
