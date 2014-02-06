module SessionsHelper

	def sign_in user
		cookies.permanent[:remember_me_token] = user.remember_me_token
		current_user = user
	end

	def sign_out
		current_user = nil
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user= user
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_me_token(cookies[:remember_me_token])
	end
end
