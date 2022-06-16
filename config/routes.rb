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
  end

  get '*path', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
