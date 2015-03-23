json.array!(@answercomments) do |answercomment|
  json.extract! answercomment, :id, :body, :answer_id, :user_id
  json.url answercomment_url(answercomment, format: :json)
end
