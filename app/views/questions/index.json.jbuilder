json.array!(@questions) do |question|
  json.extract! question, :id, :title, :description, :user_id, :category_id, :tally
  json.url question_url(question, format: :json)
end
