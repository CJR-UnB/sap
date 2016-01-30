json.array!(@member_statuses) do |member_status|
  json.extract! member_status, :id, :description
  json.url member_status_url(member_status, format: :json)
end
