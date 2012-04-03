Lots::Application.routes.draw do
  resources :encounters
  resources :raids

  root :to => 'encounters#index'
end
