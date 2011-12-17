MyNote::Application.routes.draw do
  root :to => 'friend_activities#index'
  resources :friend_activities, :only => [:index, :show]
end
