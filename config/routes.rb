Rails.application.routes.draw do
  root to: 'sessions#welcome'

  get 'auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new' # controller and action
  post '/signup', to: 'users#create'
  resources :users, except: [:destroy]
  
  get '/spellbooks/recent_spellbooks' => 'spellbooks#recent_spellbooks' , as: 'recent_spellbooks'

  resources :crystal_balls
  resources :spells
  resources :spellbooks do
    resources :spells
  end

  match '*path' => 'application_controller#fallback', via: [:all] 

  

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
