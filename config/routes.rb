Rails.application.routes.draw do
  resources :categories
  resources :scheduled_agendas do
    member do
      post :add_product
      post :remember
    end
  end
  resources :products

  #devise config
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' },
  controllers: { sessions: 'sessions',
                 registrations: 'users/registrations'
                }

  #other routes
  root to: 'statics#home'

  namespace :admin do
    resources :users
  end

  namespace :mananger do
  end

  namespace :user do
  end
end
