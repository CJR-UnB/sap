json.array!(@knowledges) do |knowledge|
  json.extract! knowledge, :id, :description, :technology_id, :knowledge_level_id
  json.url knowledge_url(knowledge, format: :json)
end
