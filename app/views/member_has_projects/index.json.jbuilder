json.array!(@member_has_projects) do |member_has_project|
  json.extract! member_has_project, :id, :member_id, :project_id, :project_role_id
  json.url member_has_project_url(member_has_project, format: :json)
end
