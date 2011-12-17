MyNote::Application.routes.draw do
  root :to => 'friend_activities#index'
  resources :friend_activities, :only => [:index, :show]
  resources :places, :only => [:index, :show, :create]
  resources :checkins, :only => [:create]
end
