ActionMailer::Base.smtp_settings = {
	address: "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "MANDRILL_USERNAME",
	password: "MANDRILL_PASSWORD",
	authentication: "login",
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"