Rails.application.routes.draw do
  root to: 'site#index'
  get 'site/menu'
end
