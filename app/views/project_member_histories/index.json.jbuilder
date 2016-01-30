json.array!(@project_member_histories) do |project_member_history|
  json.extract! project_member_history, :id, :observation, :member_id, :project_id, :project_role_id
  json.url project_member_history_url(project_member_history, format: :json)
end
