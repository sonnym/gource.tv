Gourcetv::Application.routes.draw do
  root 'welcome#index'

  resources :repositories, only: [:create, :index, :show]
end
