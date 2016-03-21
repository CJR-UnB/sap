json.array!(@suggested_activities) do |suggested_activity|
  json.extract! suggested_activity, :id, :activity, :activity_type_id, :member_id, :request_status_id
  json.url suggested_activity_url(suggested_activity, format: :json)
end
