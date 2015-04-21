class AnswerMailer < ApplicationMailer
	default from: "srinmadipalli@gmail.com"

	def answer_confirm(question, answer)
		@question = question
		@answer = answer

		mail(to: @question.user.email, cc: "smadipalli@hotmail.com", subject: "An answer has been posted to your question!")
	end	

	def upvote_confirm(user)
		@user = user
		mail(to: @user.email, cc: "smadipalli@hotmail.com", subject: "Your answer has been upvoted!")		
	end

	def questioncomment_confirm(question, questioncomment)
		@question = question
		@comment = questioncomment
		
		mail(to: @question.user.email, cc: "smadipalli@hotmail.com", subject: "A comment has been posted to your question!")
	end

	def answercomment_answerconfirm(answer, answercomment)

		@comment = answercomment
		@answer = answer
		
		mail(to: @answer.user.email, cc: "smadipalli@hotmail.com", subject: "A comment has been posted to your answer")
	end

	def answercomment_questionconfirm(question)

		@question = question 
		
		mail(to: @question.user.email, cc: "smadipalli@hotmail.com", subject: "A comment has been posted to an answer to your question")
	end
end
