json.array!(@comments) do |comment|
  json.extract! comment, :cmtpost
  json.url comment_url(comment, format: :json)
end
