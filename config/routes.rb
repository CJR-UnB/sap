Rails.application.routes.draw do

  resources :knowledges
  # Define a raiz para a página de login e as rotas /login e /logout
  devise_scope :member do
    root to: "devise/sessions#new"
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  devise_for :members
  
  resources :roles
  resources :members
  resources :member_statuses
  
  resources :knowledge_requests
  resources :request_statuses
  resources :request_histories

  resources :projects
  resources :project_roles
  resources :project_statuses
  resources :project_histories
  resources :project_member_histories
  resources :member_has_projects
  
  resources :technologies
  resources :knowledge_levels
  resources :member_has_knowledges
  
  resources :activities
  resources :activity_types
  resources :member_has_activities

  resources :jobs
  resources :areas
  resources :sectors
  
  get '/home' => 'home#index'

end