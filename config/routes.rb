Rails.application.routes.draw do
  resources :patients
  resources :treatments
  root to: 'site#index'
  get 'site/menu'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :patients
    end
  end

end
