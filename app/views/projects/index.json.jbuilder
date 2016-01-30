json.array!(@projects) do |project|
  json.extract! project, :id, :description, :price, :link, :project_status_id
  json.url project_url(project, format: :json)
end
