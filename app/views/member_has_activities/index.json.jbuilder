json.array!(@member_has_activities) do |member_has_activity|
  json.extract! member_has_activity, :id, :member_id, :activity_id
  json.url member_has_activity_url(member_has_activity, format: :json)
end
