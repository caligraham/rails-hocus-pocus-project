Rails.application.routes.draw do
  resources :crystal_balls
  resources :spells
  resources :spellbooks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
