json.array!(@profiles) do |profile|
  json.extract! profile, :f_name, :l_name, :title, :area, :skills, :fb_url, :linkedin_url, :meetup_url, :twitter_url
  json.url profile_url(profile, format: :json)
end
