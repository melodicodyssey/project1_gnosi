class GnosisController < ApplicationController

	def index

    # check to see if user was redirected from Feedly
    # if not, render 'index' immediately
    # if so, run below code (set @user) then create new session

    unless request.env['omniauth.auth'].nil?
      code = params['code']
      user = User.find_by_uid(request.env['omniauth.auth']['uid'])
        if user.nil?
          user = User.create_new(request.env['omniauth.auth'], code)
        else
          user = User.update_token(request.env['omniauth.auth'])
        end
      redirect_to create_session_path(user['uid'])
    end

    @user = current_user
    @topics = ['Tech','Design', 'News', 'Photography','Do It Yourself', 'Cooking']

  end

  def feed
    feed = params[:feed]
    @title = params[:title]
    @streams = fetch_stream(feed)['items']
    @link = Link.new()
  end

  def add_new_link
    link = Link.create()
  end

  def history
    uid = params[:uid]
    @user = User.find_by_uid(uid)
    @links = @user.links
    # @links = Link.where(user_id: @user.id)
  end

end