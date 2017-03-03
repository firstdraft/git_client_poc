Rails.application.routes.draw do

  namespace :dev do
    namespace :git do
      get "/" => "commands#status"
      get "status" => "commands#status"
      resource :branch, only: [:create, :show, :delete]
      get "branches/checkout"
      get "branches/delete"
      resources :commits, only: :create
      post "commits/stash"
      get "commits/push"
    end
  end

end
