json.array!(@deleteposts) do |deletepost|
  json.extract! deletepost, :post_id, :user_id
  json.url deletepost_url(deletepost, format: :json)
end
