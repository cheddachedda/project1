Rails.application.routes.draw do
  get 'teams/index'
  get 'teams/new'
  get 'teams/create'
  get 'teams/show'
  get 'teams/edit'
  get 'teams/update'
  get 'teams/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
