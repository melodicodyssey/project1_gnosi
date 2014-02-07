class LinksController < ApplicationController

	def create
		fields = params.require(:link).permit(:url, :title, :comments)
		new_link = Link.create(fields)
		current_user.links << new_link
		redirect_to start_path
	end
end