MyNote::Application.routes.draw do
  root :to => 'notes#index'
  resources :notes
end
