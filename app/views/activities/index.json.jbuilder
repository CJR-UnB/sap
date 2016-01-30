json.array!(@activities) do |activity|
  json.extract! activity, :id, :description, :credit_numbers, :activity_type_id
  json.url activity_url(activity, format: :json)
end
