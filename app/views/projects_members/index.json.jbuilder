json.array!(@projects_members) do |projects_member|
  json.extract! projects_member, :id, :member_id, :project_id
  json.url projects_member_url(projects_member, format: :json)
end
