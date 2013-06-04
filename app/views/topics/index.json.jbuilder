json.array!(@topics) do |topic|
  json.extract! topic, :title, :content, :created_by_id
  json.url topic_url(topic, format: :json)
end