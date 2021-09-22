Rails.application.routes.draw do
  #devise config
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' },
  controllers: { sessions: 'users/sessions',

                }

  #other routes
  root to: 'statics#home'
end
