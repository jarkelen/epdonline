Rails.application.routes.draw do
  resources :patients
  root to: 'site#index'
  get 'site/menu'
end
