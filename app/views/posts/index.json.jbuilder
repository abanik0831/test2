json.array!(@posts) do |post|
  json.extract! post, :post, :profile_id
  json.url post_url(post, format: :json)
end
