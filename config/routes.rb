Gourcetv::Application.routes.draw do
  root 'welcome#index'

  get :status, controller: :system_status, action: :index

  get '/repository/:id', to: 'welcome#index', name: :repository
  resources :repositories, only: [:create, :index, :show]
end
