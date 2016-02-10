Rails.application.routes.draw do

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
  
  resources :knowledges
  resources :knowledge_levels
  resources :knowledge_requests
  resources :knowledges_members
  resources :request_statuses
  resources :request_histories

  resources :projects
  resources :project_roles
  resources :project_statuses
  resources :project_histories
  resources :project_member_histories
  resources :members_projects
  
  resources :technologies
  
  resources :activities
  resources :activity_types
  resources :activities_members

  resources :jobs
  resources :areas
  resources :sectors
  
  get '/home' => 'home#index'
  get '/projects_overview' => 'projects_overview#index'
  get '/welcome' => 'welcome#index'

  post '/activities/associar/:id' => 'activities#associar', as: :associar_atividade
  post '/knowledges/requisitar/:id' => 'knowledges#requisitar', as: :requisitar_conhecimento

  post '/knowledge_requests/aprovar_conhecimento/:id' => 'knowledge_requests#aprovar_conhecimento', as: :aprovar_conhecimento
  post '/knowledge_requests/recusar_conhecimento/:id' => 'knowledge_requests#recusar_conhecimento', as: :recusar_conhecimento
  post '/knowledge_requests/analisar_conhecimento/:id' => 'knowledge_requests#analisar_conhecimento', as: :analisar_conhecimento

end