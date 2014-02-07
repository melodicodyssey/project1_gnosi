class SessionsController < ApplicationController
  def new
  end

# map post '/' to sessions#create

  def create

	user = User.find_by_uid(params[:uid])
	sign_in user
	flash[:success] = "You have successfully logged in to Feedly!"
	redirect_to start_path
  end

  def destroy
	sign_out
	redirect_to start_path
  end


end
