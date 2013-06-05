json.(@topic, :id, :title, :content)
json.author @topic.created_by.name
json.date l(@topic.created_at, :format=>:long)
json.posts @topic.replies do |reply|
    json.(reply, :id, :content)
    json.author reply.created_by.name
    json.date l(reply.created_at, :format=>:long)
end