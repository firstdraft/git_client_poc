Rails.application.routes.draw do
  get "dev/git" => "dev/git/commands#status"

  namespace :dev do
    namespace :git do
      resources :branches
    end
  end

end
