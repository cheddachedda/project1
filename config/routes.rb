Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :fixtures
  resources :teams
end
