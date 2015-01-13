Gourcetv::Application.routes.draw do
  root 'welcome#index'

  get :status, controller: :system_status, action: :index

  resources :repositories, only: [:create, :index, :show]
end
