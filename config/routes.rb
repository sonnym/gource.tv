Gourcetv::Application.routes.draw do
  root 'welcome#index'

  get :status, controller: :system_status, action: :index

  get '/repository/:id', to: redirect('#!/repository/%{id}')
  resources :repositories, only: [:create, :index, :show]
end
