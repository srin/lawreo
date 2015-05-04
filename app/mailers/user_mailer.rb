class UserMailer < ApplicationMailer
	default from: "srinmadipalli@gmail.com"

		def new_user_lawyer(user)
			@user = user
			mail(to: @user.email, cc: "hello@lawreo.com", subject: "Welcome to Lawreo")
			
		end

		def new_user_nonlawyer(user)
			@user = user
			mail(to: @user.email, cc: "hello@lawreo.com", subject: "Welcome to Lawreo")
			
		end
end
