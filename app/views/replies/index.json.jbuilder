json.array!(@replies) do |reply|
  json.extract! reply, :topic_id, :content, :created_by_id
  json.url reply_url(reply, format: :json)
end