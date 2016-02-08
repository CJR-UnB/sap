json.array!(@members_projects) do |members_project|
  json.extract! members_project, :id, :member_id, :project_id
  json.url members_project_url(members_project, format: :json)
end
