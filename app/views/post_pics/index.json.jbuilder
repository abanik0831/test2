json.array!(@post_pics) do |post_pic|
  json.extract! post_pic, :post_id, :picture
  json.url post_pic_url(post_pic, format: :json)
end
