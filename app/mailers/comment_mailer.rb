class CommentMailer < ApplicationMailer
		default from: "srinmadipalli@gmail.com"

	def questioncomment_confirm(question, questioncomment)
		@question = question
		@comment = questioncomment

		mail(to: @question.user.email, cc: "hello@lawreo.com", subject: "A comment has been posted to your question")
	end	

	def answercomment_confirm_oqp(question)
		@question = question

		mail(to: @question.user.email, cc: "hello@lawreo.com", subject: "A comment has been posted to an answer to your question")
	end

	def answercomment_confirm_answerer(question, answer)
		@question = question
		@answer = answer
		mail(to: @answer.user.email, cc: "hello@lawreo.com", subject: "A comment has been posted to your answer")	
	end
end
