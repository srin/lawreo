class AnswerMailer < ApplicationMailer
	default from: "srinmadipalli@gmail.com"

	def answer_confirm(question, answer)
		@question = question
		@answer = answer

		mail(to: @question.user.email, cc: "smadipalli@hotmail.com", subject: "An answer has been posted to your question!")
	end	

	def upvote_confirm(question, user)
		@user = user
		@question = question
		mail(to: @user.email, cc: "smadipalli@hotmail.com", subject: "Your answer has been upvoted!")
	end
end
