json.array!(@profile_pics) do |profile_pic|
  json.extract! profile_pic, :image
  json.url profile_pic_url(profile_pic, format: :json)
end
