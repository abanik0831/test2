json.array!(@likes) do |like|
  json.extract! like, :post_id, :profile_id
  json.url like_url(like, format: :json)
end
