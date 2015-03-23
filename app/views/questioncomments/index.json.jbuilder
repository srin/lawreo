json.array!(@questioncomments) do |questioncomment|
  json.extract! questioncomment, :id, :body, :question_id, :user_id
  json.url questioncomment_url(questioncomment, format: :json)
end
