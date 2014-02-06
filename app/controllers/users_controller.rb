class UsersController < ApplicationController

	# before_filter :signed_in?, only: (:feed, :history)

	def new
		@user = User.new()
	end

	def create
		@new_user = User.new(user_params)
		if @new_user.save
			sign_in @new_user
			flash[:message] = "Thank you for registering for Gnosi!"
			redirect_to feed_path(@new_user.id)
		else
			flash[:failure] = "Invalid information"
			redirect_to new_user_path
		end	
	end

	def feed
	end

	def history
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
