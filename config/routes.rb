Rails.application.routes.draw do
  resources :patients
  resources :treatments
  root to: 'site#index'
  get 'site/menu'
end
