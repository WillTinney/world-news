Rails.application.routes.draw do
  root to: 'pages#home'

  resources :countries, only: [ :show ]
end
