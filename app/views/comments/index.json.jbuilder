json.array!(@comments) do |comment|
  json.extract! comment, :name, :body, :email
  json.url comment_url(comment, format: :json)
end
