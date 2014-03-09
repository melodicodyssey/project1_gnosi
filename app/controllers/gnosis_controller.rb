class GnosisController < ApplicationController

	def index

    # check to see if user was redirected from Feedly
    # if not, render 'index' immediately
    # if so, run below code (set @user) then create new session

    unless request.env['omniauth.auth'].nil?
      code = params['code'] ;  env = request.env['omniauth.auth']
      if User.find_by_uid(env['uid']).nil?
          user = User.create_new(env, code)
          # enc = CGI.escape(env)
          # redirect_to create_user_path(code, env)
        else
          user = User.update_token(env)
          # redirect_to update_path(enc)
        end
      redirect_to create_session_path(user['uid'])
    end

    @user = current_user
    @topics = ['Tech','Design', 'News', 'Photography','Do It Yourself', 'Cooking']

  end

  def auth_failure
    flash[:no_auth] = "Invalid login credentials"
    redirect_to start_path
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
  end

end