json.array!(@answers) do |answer|
  json.extract! answer, :id, :body, :post_id, :user_id
  json.url answer_url(answer, format: :json)
end
