Rails.application.routes.draw do
  root :to => 'pages#home'

  resources :fixtures, :only => [ :index ]
  get '/fixtures/:round' => 'fixtures#round', as: 'round'
  get '/fixtures/:round/:id' => 'fixtures#show', as: 'fixture'

  resources :teams
end
