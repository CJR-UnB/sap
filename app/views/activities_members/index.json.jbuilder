json.array!(@activities_members) do |activities_member|
  json.extract! activities_member, :id, :member_id, :activity_id
  json.url activities_member_url(activities_member, format: :json)
end
