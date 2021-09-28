Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end
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
