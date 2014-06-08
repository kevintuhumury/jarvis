Rails.application.routes.draw do

  devise_for :admins, path: "admin", path_names: { sign_in: "login", sign_out: "logout" }

  resources :pages

  root to: "pages#index"

end
