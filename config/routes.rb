MyNote::Application.routes.draw do
  root :to => 'home#index'
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => "sessions#error"
  match '/signout', :to => "sessions#destroy"
  
  resources :friend_activities, :only => [:index, :show]
  resources :places, :only => [:index, :show, :create]
  resources :checkins, :only => [:create]
end
