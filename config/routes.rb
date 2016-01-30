Rails.application.routes.draw do

  devise_for :members

  resources :members
  resources :member_statuses

  resources :roles

  resources :knowledge_requests
  resources :request_statuses
  resources :request_histories

  resources :projects
  resources :project_roles
  resources :project_statuses
  resources :project_histories
  resources :project_member_histories
  resources :member_has_projects
  
  resources :knowledges
  resources :technologies
  resources :knowledge_levels
  resources :member_has_knowledges
  
  resources :activities
  resources :activity_types
  resources :member_has_activities

  resources :jobs
  resources :areas
  resources :sectors
  
end