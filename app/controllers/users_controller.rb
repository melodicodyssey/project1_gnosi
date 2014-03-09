class UsersController < ApplicationController

	# before_filter :signed_in?, only: (:feed, :history)

	def create
		# env = params[:env]
		# code = params[:code]
		# new_user = User.create_new(env,code)
		# redirect_to create_session_path(new_user['uid'])
	end

	# def update
		# env = params[:env]
		# updated_user = User.update_token(env)
		# redirect_to start_path
	# end

end
