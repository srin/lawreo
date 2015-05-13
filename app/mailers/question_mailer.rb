class QuestionMailer < ApplicationMailer
	default from: "srinmadipalli@gmail.com"

	def question_notification(question)
		@question = question
		

		mail(to: @question.user.email, cc: "hello@lawreo.com", subject: "Your question has been posted to Lawreo")
	end	
end
