json.array!(@requests) do |request|
  json.extract! request, :name, :email
  json.url request_url(request, format: :json)
end
