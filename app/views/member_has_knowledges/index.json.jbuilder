json.array!(@member_has_knowledges) do |member_has_knowledge|
  json.extract! member_has_knowledge, :id, :member_id, :knowledge_id
  json.url member_has_knowledge_url(member_has_knowledge, format: :json)
end
