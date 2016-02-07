json.array!(@knowledges_members) do |knowledges_member|
  json.extract! knowledges_member, :id, :member_id, :knowledge_id
  json.url knowledges_member_url(knowledges_member, format: :json)
end
