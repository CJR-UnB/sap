json.array!(@jobs) do |job|
  json.extract! job, :id, :description
  json.url job_url(job, format: :json)
end
