json.array!(@knowledge_requests) do |knowledge_request|
  json.extract! knowledge_request, :id, :member_id, :knowledge_id, :request_status_id
  json.url knowledge_request_url(knowledge_request, format: :json)
end
