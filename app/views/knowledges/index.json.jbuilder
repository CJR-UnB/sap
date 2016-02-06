json.array!(@knowledges) do |knowledge|
  json.extract! knowledge, :id, :description, :knowledge_level_id, :technology_id
  json.url knowledge_url(knowledge, format: :json)
end
