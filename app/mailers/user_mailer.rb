class UserMailer < ApplicationMailer

	default from: 'economist19999@gmail.com'
	def account_activation(user)
		@user = user
		mail to: user.email, subject: "Account activation"
	end

	def password_reset(user)
		@user = user
		mail to: user.email, subject: "Password reset"
	end
end