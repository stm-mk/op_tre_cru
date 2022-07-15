Rails.application.routes.draw do
  get 'torema_calculations/index'
  root 'home#index'

  namespace :api do
    resources :posts
    resources :users do
      collection do
        get 'me'
      end
    end
    resources :sessions
    resources :my_post
    resources :profile
    resources :tags
  end

  get '*path', to: 'home#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
